#!/bin/bash

rm -rf results.csv
rm -rf report.txt
filename='data.txt'
while read line; 
do 
curl --url "https://www.virustotal.com/vtapi/v2/url/report?apikey=c285ae41bd905acff2b39d68a626e7721986d3ba0e6fa1effdb696fbaa922d69&resource=${line}" > report.txt
Clean=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "clean site"')
Unrated=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "unrated site"')
Phishing=$(''tr ',' '[\n*]' < report.txt | grep -c -w '"result": "phishing site"')
Malicious="$Phishing"
touch results.csv
echo "$line","$Clean","$Unrated","$Phishing","$Malicious" > header.csv && cat results.csv >> header.csv && mv header.csv results.csv
sleep 15
done < $filename
echo "Domain Name","Clean Sites","Unrated Sites","Phishing Sites","Malicious Sites" > header.csv && cat results.csv >> header.csv && mv header.csv results.csv
cat results.csv
