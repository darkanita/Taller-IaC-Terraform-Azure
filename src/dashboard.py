import json, pathlib

with open("output/data.json") as f:
    data = json.load(f)

html = f"""<!DOCTYPE html>
<html><head><title>Dashboard {data['ambiente']}</title></head>
<body>
  <h1>Pipeline Dashboard</h1>
  <p>Ambiente: <strong>{data['ambiente']}</strong></p>
  <p>Registros procesados: <strong>{data['registros']}</strong></p>
  <p>Status: <strong>{data['status']}</strong></p>
</body></html>"""

pathlib.Path("output").mkdir(exist_ok=True)
with open("output/index.html", "w") as f:
    f.write(html)

print("[dashboard] index.html generado en output/")
