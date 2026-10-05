from datetime import date
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Clinic Operations API", version="0.1.0")


class ConsumptionIn(BaseModel):
    encounter_id: int
    product_name: str
    quantity: float
    nurse_id: int


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/inventory/alerts")
def inventory_alerts():
    return {
        "low_stock": [
            {"product": "Ceftriaxone", "remaining": 12, "threshold": 20},
        ],
        "expiring_soon": [
            {"product": "NaCl 0.9%", "expires_at": str(date.today())},
        ],
    }


@app.post("/consumptions")
def create_consumption(data: ConsumptionIn):
    return {
        "message": "Consumption logged",
        "inventory_deducted": True,
        "sanitary_notification_created": True,
        "payload": data.model_dump(),
    }
