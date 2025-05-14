import os
from urllib.parse import unquote
from flask import Blueprint, jsonify, request
from .models import doctor_address, doctor_business_hour, doctor_category, doctor_price_policy, Doctor, Address, BusinessHour, Category, Name, PricePolicy
from . import db

bp = Blueprint("api", __name__, url_prefix="/api")

@bp.route("/doctor", methods=["GET"])
def getAllDoctors():
    filters = list()
    query = db.session.query(Doctor)
    if request.args.get("district") is not None:
        filters.append(Address.district == request.args.get("district"))
        query = query.join(doctor_address).join(Address).filter(*filters)
        #return jsonify(result)
    if request.args.get("category") is not None:
        filters.append(Category.name == unquote(request.args.get("category")))
        query = query.join(doctor_category).join(Category).filter(*filters)
    if request.args.get("max-price") is not None:
        filters.append(Doctor.price <= float(request.args.get("max-price")))
    if request.args.get("min-price") is not None:
        filters.append(Doctor.price >= float(request.args.get("min-price")))
    
    result = query.filter(*filters).all()
    if result is None:
        return jsonify({})
    else:
        if request.args.get("lang") is not None:
            doctors = list()
            for doctor in result:
                doctor.names = [name for name in doctor.names if name.lang == request.args.get("lang")]
                doctor.addresses = [address for address in doctor.addresses if address.lang == request.args.get("lang")]
                doctor.businessHours = [businessHour for businessHour in doctor.businessHours if businessHour.lang == request.args.get("lang")]
                doctor.categories = [category for category in doctor.categories if category.lang == request.args.get("lang")]
                doctor.pricePolicies = [pricePolicy for pricePolicy in doctor.pricePolicies if pricePolicy.lang == request.args.get("lang")]
                doctors.append(doctor)
            return jsonify(doctors)
        else:
            return jsonify(result)

@bp.route("/doctor/<int:doctor_id>", methods=["GET"])
def getDoctor(doctor_id: int):
    result = db.session.query(Doctor).filter(Doctor.id == doctor_id).first()
    if result is None:
        return jsonify({"error": "Doctor not found"}), 404
    return jsonify(result)

@bp.route("/doctor/create", methods=["POST"])
def createDoctor():
    data = request.json
    if data is None:
        return jsonify({"error": "No json payload is provided"}), 400
    else:
        if data["price"] is not None and data["phone"] is not None:
            price = float(data["price"])
            phone = data["phone"]
            doctor = Doctor(price=price, phone=phone)
            db.session.add(doctor)
            db.session.flush()
            doctorId = doctor.id
            for name in data["names"]:
                nameObj = Name(doctorId=doctorId, lang=name["lang"], name=name["name"])
                db.session.add(nameObj)
            for address in data["addresses"]:
                addressObj = Address(lang=address["lang"], address=address["address"], district=address["district"])
                db.session.add(addressObj)
                db.session.flush()
                doctorAddress = doctor_address.insert().values(doctor_id=doctorId, address_id=addressObj.id)
                db.session.execute(doctorAddress)
            for businessHour in data["businessHours"]:
                businessHourObj = BusinessHour(lang=businessHour["lang"], hourStr=businessHour["hourStr"])
                db.session.add(businessHourObj)
                db.session.flush()
                doctorBusinessHour = doctor_business_hour.insert().values(doctor_id=doctorId, business_hour_id=businessHourObj.id)
                db.session.execute(doctorBusinessHour)
            for category in data["categories"]:
                categoryObj = Category(lang=category["lang"], name=category["name"])
                db.session.add(categoryObj)
                db.session.flush()
                doctorCategory = doctor_category.insert().values(doctor_id=doctorId, category_id=categoryObj.id)
                db.session.execute(doctorCategory)
            for pricePolicy in data["pricePolicies"]:
                pricePolicyObj = PricePolicy(lang=pricePolicy["lang"], description=pricePolicy["description"])
                db.session.add(pricePolicyObj)
                db.session.flush()
                doctorPricePolicy = doctor_price_policy.insert().values(doctor_id=doctorId, price_policy_id=pricePolicyObj.id)
                db.session.execute(doctorPricePolicy)
            db.session.commit()
            return jsonify({"doctorId": doctorId})