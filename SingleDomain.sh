#!/bin/bash
rm -rf report.txt
rm -rf results.csv
domain="https://go5.boardbooks.com/"
#echo "$domain"
curl --url 'https://www.virustotal.com/vtapi/v2/url/report?apikey=d7cabc7be1d9d9f4ed2e1c74aa66cb24c1cab8e90b61595c04e32b996b25867c&resource=https://go5.boardbooks.com/' > report.txt
Clean=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "clean site"')
Unrated=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "unrated site"')
Phishing=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "phishing site"')
Malicious="$Phishing"
touch results.csv
echo "$domain","$Clean","$Unrated","$Phishing","$Malicious" > header.csv && cat results.csv >> header.csv && mv header.csv results.csv
echo "Domain Name","Clean Sites","Unrated Sites","Phishing Sites","Malicious Sites" > header.csv && cat results.csv >> header.csv && mv header.csv results.csv
cat results.csv
