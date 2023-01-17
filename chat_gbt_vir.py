import json
import requests

url = "https://www.virustotal.com/vtapi/v2/url/report"
params = {"apikey": "d7cabc7be1d9d9f4ed2e1c74aa66cb24c1cab8e90b61595c04e32b996b25867c", "resource": "https://go5.boardbooks.com/"}
response = requests.get(url, params=params)

if response.status_code == 200:
    json_response = response.json()
    print("Detection rate: ", json_response["positives"] / json_response["total"] * 100)
else:
    print("Error: ", response.status_code)
   