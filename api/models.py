from dataclasses import dataclass
from urllib.parse import unquote
from flask import jsonify, request
from sqlalchemy import Column, Float, ForeignKey, String, Table
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship

class Base(DeclarativeBase):
    pass

doctor_address = Table("doctor_address", Base.metadata, Column("doctor_id", ForeignKey("doctor.id")), Column("address_id", ForeignKey("address.id")))
doctor_business_hour = Table("doctor_business_hour", Base.metadata, Column("doctor_id", ForeignKey("doctor.id")), Column("business_hour_id", ForeignKey("business_hour.id")))
doctor_category = Table("doctor_category", Base.metadata, Column("doctor_id", ForeignKey("doctor.id")), Column("category_id", ForeignKey("category.id")))
doctor_price_policy = Table("doctor_price_policy", Base.metadata, Column("doctor_id", ForeignKey("doctor.id")), Column("price_policy_id", ForeignKey("price_policy.id")))

@dataclass
class Doctor(Base):
    __tablename__ = "doctor"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    price: Mapped[float] = mapped_column(Float)
    phone: Mapped[str] = mapped_column(String(30))
    names: Mapped[list["Name"]] = relationship()
    addresses: Mapped[list["Address"]] = relationship(secondary=doctor_address)
    businessHours: Mapped[list["BusinessHour"]] = relationship(secondary=doctor_business_hour)
    categories: Mapped[list["Category"]] = relationship(secondary=doctor_category)
    pricePolicies: Mapped[list["PricePolicy"]] = relationship(secondary=doctor_price_policy)

@dataclass
class Name(Base):
    __tablename__ = "name"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    doctorId: Mapped[int] = mapped_column("doctor_id", ForeignKey("doctor.id"))
    lang: Mapped[str] = mapped_column(String(5))
    name: Mapped[str] = mapped_column(String(50))
    
@dataclass
class Address(Base):
    __tablename__ = "address"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    lang: Mapped[str] = mapped_column(String(5))
    address: Mapped[str] = mapped_column(String(100))
    district: Mapped[str] = mapped_column(String(50))

@dataclass
class BusinessHour(Base):
    __tablename__ = "business_hour"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    lang: Mapped[str] = mapped_column(String(5))
    hourStr: Mapped[str] = mapped_column("hour_string", String(200))

@dataclass
class Category(Base):
    __tablename__ = "category"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    lang: Mapped[str] = mapped_column(String(5))
    name: Mapped[str] = mapped_column(String(50))

@dataclass
class PricePolicy(Base):
    __tablename__ = "price_policy"
    id: Mapped[int] = mapped_column(primary_key=True, autoincrement=True)
    lang: Mapped[str] = mapped_column(String(5))
    description: Mapped[str] = mapped_column(String(50))