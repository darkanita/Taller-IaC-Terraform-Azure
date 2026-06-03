import os, json, pathlib

env = os.getenv("APP_ENV", "development")
print(f"[pipeline] Ejecutando en ambiente: {env}")

data = {"ambiente": env, "registros": 42, "status": "ok"}
pathlib.Path("output").mkdir(exist_ok=True)
with open("output/data.json", "w") as f:
    json.dump(data, f, indent=2)

print("[pipeline] data.json generado en output/")
