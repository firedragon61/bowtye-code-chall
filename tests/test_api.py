import os
import pytest

from api import create_app

@pytest.fixture
def app():
    app = create_app()
    yield app

@pytest.fixture
def client(app):
    yield app.test_client()

# query /api/doctor and get some existing data
def test_list_doctor(client):
    response = client.get("/api/doctor")
    assert response.status_code == 200
    assert len(response.json) == 3

# query /api/doctor/1 and check the details
def test_get_doctor(client):
    response = client.get("/api/doctor/1")
    assert response.status_code == 200
    assert response.json["id"] == 1
    assert response.json["phone"] == "28773222,28773888"
    assert response.json["price"] == 540
    # should have 2 addresses, one in Chinese and one in English
    assert len(response.json["addresses"]) == 2

# query /api/doctor with various query parameter combinations
def test_get_doctor_with_params(client):
    response = client.get("/api/doctor?district=灣仔區")
    assert response.status_code == 200
    # should have 2 doctors in this district
    assert len(response.json) == 2
    response = client.get("/api/doctor?district=灣仔區&max-price=180")
    # should have 1 doctor in this district with this price
    assert len(response.json) == 1
    response = client.get("/api/doctor?category=General Practitioner")
    assert len(response.json) == 2
    response = client.get("/api/doctor?category=Specialist")
    assert len(response.json) == 1
    response = client.get("/api/doctor?category=Specialist&min-price=180&max-price=300")
    assert len(response.json) == 1
    response = client.get("/api/doctor?min-price=80&max-price=300")
    assert len(response.json) == 2

# create a new doctor with json payload
def test_create_doctor_with_json(client):
    data = {
        "price": 1000,
        "phone": "12345678",
        "names": [
            {"lang": "en", "name": "Au Lik Hong"},
            {"lang": "zh", "name": "歐力康"}
        ],
        "addresses": [
            {"lang": "en", "address": "Room A, 20/F, 123 Waterloo Road, Mongkok", "district": "Yau Tsim Mong"},
            {"lang": "zh", "address": "旺角窩打老道123號20樓A室", "district": "油尖旺區"}
        ],
        "businessHours": [
            {"lang": "en", "hourStr": "Mon-Fri:9am-5pm"},
            {"lang": "zh", "hourStr": "星期一至星期五:上午9時至下午5時"}
        ],
        "categories": [
            {"lang": "en", "name": "SP"},
            {"lang": "zh", "name": "專科醫生"}
        ],
        "pricePolicies": [
            {"lang": "en", "description": "inclusive 7 Days of Western medicine"},
            {"lang": "zh", "description": "包括7日西藥"}
        ]
    }
    response = client.post("/api/doctor/create", json=data)
    assert response.status_code == 200
    assert response.json["doctorId"] > 0