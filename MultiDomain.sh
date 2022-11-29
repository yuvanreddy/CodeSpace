#!/bin/bash

rm -rf report1.txt

rm -rf results1.csv
touch results1.csv
domains=([1]="https://go.boardbooks.com/" [2]="https://go2.boardbooks.com/" [3]="https://go3.boardbooks.com/" [4]="https://go4.boardbooks.com/" [5]="https://go5.boardbooks.com/")

echo ${domains[@]}

#len=${#domains[@]}

for ele in ${domains[@]} 
do 
  echo $ele
  #rm -rf report1.txt
  
  curl --url "https://www.virustotal.com/vtapi/v2/url/report?apikey=d7cabc7be1d9d9f4ed2e1c74aa66cb24c1cab8e90b61595c04e32b996b25867c&resource=${ele}" > report1.txt
  Clean=$(''tr ',' '[\n*]' < report1.txt | grep -c -w '"result": "clean site"')

  Unrated=$(''tr ',' '[\n*]' < report1.txt | grep -c -w '"result": "unrated site"')

  Phishing=$(''tr ',' '[\n*]' < report1.txt | grep -c -w '"result": "phishing site"')

  Malicious="$Phishing"
  
  touch results1.csv
 
  echo "$ele","$Clean","$Unrated","$Phishing","$Malicious" > header.csv && cat results1.csv >> header.csv && mv header.csv results1.csv
  
done

echo "Domain Name","Clean Sites","Unrated Sites","Phishing Sites", "Malicious Sites" > header.csv && cat results1.csv >> header.csv && mv header.csv results1.csv

cat results1.csv
