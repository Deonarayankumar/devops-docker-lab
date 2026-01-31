from fastapi import FastAPI
import os

app = FastAPI(title="DevOps Docker Lab API", version="1.0.0")


@app.get("/health")
def health():
    db = os.getenv("DATABASE_URL", "not-set")
    return {"status": "ok", "database_configured": db != "not-set"}


@app.get("/")
def root():
    return {"message": "Hello from python-api"}
