#!/bin/bash
var1="https://go.boardbooks.com/"
var2="https://account.boardpacks.com"
var3="https://account.boardpacks.com"
var4="https://portal.boardpacks2.lu"
var5="https://portal.boardpacks2.com"
curl --request POST \
  --url 'https://www.virustotal.com/vtapi/v2/url/scan' \
  --data 'apikey=774576962c9f010ee99422f588327b77990158063fdf377dadc49c1346ee7445' \
  --data 'url=$var1'
grep -c -w "clean" -e "unrated" -e "phishing" >>result
curl --request POST \
  --url 'https://www.virustotal.com/vtapi/v2/url/scan' \
  --data 'apikey=774576962c9f010ee99422f588327b77990158063fdf377dadc49c1346ee7445' \
  --data 'url=$var2'
grep -c -w "clean" -e "unrated" -e "phishing" >>result
 curl --request POST \
  --url 'https://www.virustotal.com/vtapi/v2/url/scan' \
  --data 'apikey=774576962c9f010ee99422f588327b77990158063fdf377dadc49c1346ee7445' \
  --data 'url=$var3