import requests
import json
import csv
import time 
import fileinput

with open('report.csv', 'w', encoding='UTF8', newline='') as f:
        header = ['URL', 'CLEANED_SITES', 'UNRATED_SITES', 'PHISHING_SITES', 'MALICIOUS_SITES'] 
        writer = csv.writer(f)
        writer.writerow(header)
        
        url = 'https://www.virustotal.com/vtapi/v2/url/report' 
        apikey = 'd7cabc7be1d9d9f4ed2e1c74aa66cb24c1cab8e90b61595c04e32b996b25867c'
        
        for domain in fileinput.input(files = 'url.txt'):
          params = {'apikey': apikey, 'resource': domain }
          response = requests.get(url, params=params)
          data = response.json()
          report_str = json.dumps(data, indent=2)
          clean_sites = report_str.count('clean')
          phishing_sites = report_str.count('phishing')
          unrated_sites = report_str.count('unrated')
          malicious_sites = phishing_sites
          data = [domain, clean_sites ,unrated_sites, phishing_sites, malicious_sites]
          writer.writerow(data)    
          time.sleep(15)
   
