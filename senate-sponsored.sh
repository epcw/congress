#!/bin/bash

#searches for bills sponsored by members of congress going back to the 105th congress (1997)  NOTE - toggle for pre and post 113th congress, because pro-publica API db changes.

#raw curl in case you need it for testing purposes "curl -H 'X-Api-Key: INSERTYOURAPIKEYHERE' https://api.propublica.org/congress/v1/members/B001260/bills/cosponsored.json" where B001260 is the member ID

#usage: ./senate-sponsored.sh members-115senate-idsonly.txt

#backup old file
cat senate-sponsored.txt > senate-sponsored-old.txt
> senate-sponsored.txt

#print column names to screen, then to output file
echo "congress | bill_id | title | sponsor_id | date_introduced | house_passed | senate_passed | enacted | url"
echo "congress|bill_id|title|sponsor_id|date_introduced|house_passed|senate_passed|enacted|url" >> senate-sponsored.txt

while read line;
do

url_base="https://api.propublica.org/congress/v1/members/$line/bills/cosponsored.json"

page_first=$(curl -H 'X-Api-Key: INSERTYOURAPIKEYHERE' $url_base | jq '.["results"] | .[].bills' ) #replace with your API key

#all bills
bill_idraw_first=$(echo $page_first | jq '.[].bill_id' | sed -e 's/\"//g')
congressraw_first=$(echo $page_first | jq '.[].congress' | sed -e 's/\"//g')
titleraw_first=$(echo -e ${page_first} | jq '.[].short_title' | sed -e 's/\"//g' -e 's/ /_/g')
dateraw_first=$(echo $page_first | jq '.[].introduced_date' | sed -e 's/\"//g')
housepassedraw_first=$(echo $page_first | jq '.[].house_passage' | sed -e 's/\"//g')
senatepassedraw_first=$(echo $page_first | jq '.[].senate_passage' | sed -e 's/\"//g')
enactedraw_first=$(echo $page_first | jq '.[].enacted' | sed -e 's/\"//g')
urlraw_first=$(echo $page_first | jq '.[].congressdotgov_url' | sed -e 's/\"//g')

#bill1
bill_id1_first=$(echo $bill_idraw_first | awk '{print $1}')
congress1_first=$(echo $congressraw_first | awk '{print $1}')
title1_first=$(echo $titleraw_first | awk '{print $1}')
date1_first=$(echo $dateraw_first | awk '{print $1}')
housepassed1_first=$(echo $housepassedraw_first | awk '{print $1}')
senatepassed1_first=$(echo $senatepassedraw_first | awk '{print $1}')
enacted1_first=$(echo $enactedraw_first | awk '{print $1}')
url1_first=$(echo $urlraw_first | awk '{print $1}')

echo "$line | $congress1_first | $bill_id1_first | $title1_first | $date1_first | $housepassed1_first | $senatepassed1_first | $enacted1_first | $url1_first"
echo "$line|$congress1_first|$bill_id1_first|$title1_first|$date1_first|$housepassed1_first|$senatepassed1_first|$enacted1_first|$url1_first" >> senate-sponsored.txt

#bill2
bill_id2_first=$(echo $bill_idraw_first | awk '{print $2}')
congress2_first=$(echo $congressraw_first | awk '{print $2}')
title2_first=$(echo $titleraw_first | awk '{print $2}')
date2_first=$(echo $dateraw_first | awk '{print $2}')
housepassed2_first=$(echo $housepassedraw_first | awk '{print $2}')
senatepassed2_first=$(echo $senatepassedraw_first | awk '{print $2}')
enacted2_first=$(echo $enactedraw_first | awk '{print $2}')
url2_first=$(echo $urlraw_first | awk '{print $2}')

echo "$line | $congress2_first | $bill_id2_first | $title2_first | $date2_first | $housepassed2_first | $senatepassed2_first | $enacted2_first | $url2_first"
echo "$line|$congress2_first|$bill_id2_first|$title2_first|$date2_first|$housepassed2_first|$senatepassed2_first|$enacted2_first|$url2_first" >> senate-sponsored.txt

#bill3
bill_id3_first=$(echo $bill_idraw_first | awk '{print $3}')
congress3_first=$(echo $congressraw_first | awk '{print $3}')
title3_first=$(echo $titleraw_first | awk '{print $3}')
date3_first=$(echo $dateraw_first | awk '{print $3}')
housepassed3_first=$(echo $housepassedraw_first | awk '{print $3}')
senatepassed3_first=$(echo $senatepassedraw_first | awk '{print $3}')
enacted3_first=$(echo $enactedraw_first | awk '{print $3}')
url3_first=$(echo $urlraw_first | awk '{print $3}')

echo "$line | $congress3_first | $bill_id3_first | $title3_first | $date3_first | $housepassed3_first | $senatepassed3_first | $enacted3_first | $url3_first"
echo "$line|$congress3_first|$bill_id3_first|$title3_first|$date3_first|$housepassed3_first|$senatepassed3_first|$enacted3_first|$url3_first" >> senate-sponsored.txt

#bill4
bill_id4_first=$(echo $bill_idraw_first | awk '{print $4}')
congress4_first=$(echo $congressraw_first | awk '{print $4}')
title4_first=$(echo $titleraw_first | awk '{print $4}')
date4_first=$(echo $dateraw_first | awk '{print $4}')
housepassed4_first=$(echo $housepassedraw_first | awk '{print $4}')
senatepassed4_first=$(echo $senatepassedraw_first | awk '{print $4}')
enacted4_first=$(echo $enactedraw_first | awk '{print $4}')
url4_first=$(echo $urlraw_first | awk '{print $4}')

echo "$line | $congress4_first | $bill_id4_first | $title4_first | $date4_first | $housepassed4_first | $senatepassed4_first | $enacted4_first | $url4_first"
echo "$line|$congress4_first|$bill_id4_first|$title4_first|$date4_first|$housepassed4_first|$senatepassed4_first|$enacted4_first|$url4_first" >> senate-sponsored.txt

#bill5
bill_id5_first=$(echo $bill_idraw_first | awk '{print $5}')
congress5_first=$(echo $congressraw_first | awk '{print $5}')
title5_first=$(echo $titleraw_first | awk '{print $5}')
date5_first=$(echo $dateraw_first | awk '{print $5}')
housepassed5_first=$(echo $housepassedraw_first | awk '{print $5}')
senatepassed5_first=$(echo $senatepassedraw_first | awk '{print $5}')
enacted5_first=$(echo $enactedraw_first | awk '{print $5}')
url5_first=$(echo $urlraw_first | awk '{print $5}')

echo "$line | $congress5_first | $bill_id5_first | $title5_first | $date5_first | $housepassed5_first | $senatepassed5_first | $enacted5_first | $url5_first"
echo "$line|$congress5_first|$bill_id5_first|$title5_first|$date5_first|$housepassed5_first|$senatepassed5_first|$enacted5_first|$url5_first" >> senate-sponsored.txt

#bill6
bill_id6_first=$(echo $bill_idraw_first | awk '{print $6}')
congress6_first=$(echo $congressraw_first | awk '{print $6}')
title6_first=$(echo $titleraw_first | awk '{print $6}')
date6_first=$(echo $dateraw_first | awk '{print $6}')
housepassed6_first=$(echo $housepassedraw_first | awk '{print $6}')
senatepassed6_first=$(echo $senatepassedraw_first | awk '{print $6}')
enacted6_first=$(echo $enactedraw_first | awk '{print $6}')
url6_first=$(echo $urlraw_first | awk '{print $6}')

echo "$line | $congress6_first | $bill_id6_first | $title6_first | $date6_first | $housepassed6_first | $senatepassed6_first | $enacted6_first | $url6_first"
echo "$line|$congress6_first|$bill_id6_first|$title6_first|$date6_first|$housepassed6_first|$senatepassed6_first|$enacted6_first|$url6_first" >> senate-sponsored.txt

#bill7
bill_id7_first=$(echo $bill_idraw_first | awk '{print $7}')
congress7_first=$(echo $congressraw_first | awk '{print $7}')
title7_first=$(echo $titleraw_first | awk '{print $7}')
date7_first=$(echo $dateraw_first | awk '{print $7}')
housepassed7_first=$(echo $housepassedraw_first | awk '{print $7}')
senatepassed7_first=$(echo $senatepassedraw_first | awk '{print $7}')
enacted7_first=$(echo $enactedraw_first | awk '{print $7}')
url7_first=$(echo $urlraw_first | awk '{print $7}')

echo "$line | $congress7_first | $bill_id7_first | $title7_first | $date7_first | $housepassed7_first | $senatepassed7_first | $enacted7_first | $url7_first"
echo "$line|$congress7_first|$bill_id7_first|$title7_first|$date7_first|$housepassed7_first|$senatepassed7_first|$enacted7_first|$url7_first" >> senate-sponsored.txt

#bill8
bill_id8_first=$(echo $bill_idraw_first | awk '{print $8}')
congress8_first=$(echo $congressraw_first | awk '{print $8}')
title8_first=$(echo $titleraw_first | awk '{print $8}')
date8_first=$(echo $dateraw_first | awk '{print $8}')
housepassed8_first=$(echo $housepassedraw_first | awk '{print $8}')
senatepassed8_first=$(echo $senatepassedraw_first | awk '{print $8}')
enacted8_first=$(echo $enactedraw_first | awk '{print $8}')
url8_first=$(echo $urlraw_first | awk '{print $8}')

echo "$line | $congress8_first | $bill_id8_first | $title8_first | $date8_first | $housepassed8_first | $senatepassed8_first | $enacted8_first | $url8_first"
echo "$line|$congress8_first|$bill_id8_first|$title8_first|$date8_first|$housepassed8_first|$senatepassed8_first|$enacted8_first|$url8_first" >> senate-sponsored.txt

#bill9
bill_id9_first=$(echo $bill_idraw_first | awk '{print $9}')
congress9_first=$(echo $congressraw_first | awk '{print $9}')
title9_first=$(echo $titleraw_first | awk '{print $9}')
date9_first=$(echo $dateraw_first | awk '{print $9}')
housepassed9_first=$(echo $housepassedraw_first | awk '{print $9}')
senatepassed9_first=$(echo $senatepassedraw_first | awk '{print $9}')
enacted9_first=$(echo $enactedraw_first | awk '{print $9}')
url9_first=$(echo $urlraw_first | awk '{print $9}')

echo "$line | $congress9_first | $bill_id9_first | $title9_first | $date9_first | $housepassed9_first | $senatepassed9_first | $enacted9_first | $url9_first"
echo "$line|$congress9_first|$bill_id9_first|$title9_first|$date9_first|$housepassed9_first|$senatepassed9_first|$enacted9_first|$url9_first" >> senate-sponsored.txt

#bill10
bill_id10_first=$(echo $bill_idraw_first | awk '{print $10}')
congress10_first=$(echo $congressraw_first | awk '{print $10}')
title10_first=$(echo $titleraw_first | awk '{print $10}')
date10_first=$(echo $dateraw_first | awk '{print $10}')
housepassed10_first=$(echo $housepassedraw_first | awk '{print $10}')
senatepassed10_first=$(echo $senatepassedraw_first | awk '{print $10}')
enacted10_first=$(echo $enactedraw_first | awk '{print $10}')
url10_first=$(echo $urlraw_first | awk '{print $10}')

echo "$line | $congress10_first | $bill_id10_first | $title10_first | $date10_first | $housepassed10_first | $senatepassed10_first | $enacted10_first | $url10_first"
echo "$line|$congress10_first|$bill_id10_first|$title10_first|$date10_first|$housepassed10_first|$senatepassed10_first|$enacted10_first|$url10_first" >> senate-sponsored.txt

#bill11
bill_id11_first=$(echo $bill_idraw_first | awk '{print $11}')
congress11_first=$(echo $congressraw_first | awk '{print $11}')
title11_first=$(echo $titleraw_first | awk '{print $11}')
date11_first=$(echo $dateraw_first | awk '{print $11}')
housepassed11_first=$(echo $housepassedraw_first | awk '{print $11}')
senatepassed11_first=$(echo $senatepassedraw_first | awk '{print $11}')
enacted11_first=$(echo $enactedraw_first | awk '{print $11}')
url11_first=$(echo $urlraw_first | awk '{print $11}')

echo "$line | $congress11_first | $bill_id11_first | $title11_first | $date11_first | $housepassed11_first | $senatepassed11_first | $enacted11_first | $url11_first"
echo "$line|$congress11_first|$bill_id11_first|$title11_first|$date11_first|$housepassed11_first|$senatepassed11_first|$enacted11_first|$url11_first" >> senate-sponsored.txt

#bill12
bill_id12_first=$(echo $bill_idraw_first | awk '{print $12}')
congress12_first=$(echo $congressraw_first | awk '{print $12}')
title12_first=$(echo $titleraw_first | awk '{print $12}')
date12_first=$(echo $dateraw_first | awk '{print $12}')
housepassed12_first=$(echo $housepassedraw_first | awk '{print $12}')
senatepassed12_first=$(echo $senatepassedraw_first | awk '{print $12}')
enacted12_first=$(echo $enactedraw_first | awk '{print $12}')
url12_first=$(echo $urlraw_first | awk '{print $12}')

echo "$line | $congress12_first | $bill_id12_first | $title12_first | $date12_first | $housepassed12_first | $senatepassed12_first | $enacted12_first | $url12_first"
echo "$line|$congress12_first|$bill_id12_first|$title12_first|$date12_first|$housepassed12_first|$senatepassed12_first|$enacted12_first|$url12_first" >> senate-sponsored.txt

#bill13
bill_id13_first=$(echo $bill_idraw_first | awk '{print $13}')
congress13_first=$(echo $congressraw_first | awk '{print $13}')
title13_first=$(echo $titleraw_first | awk '{print $13}')
date13_first=$(echo $dateraw_first | awk '{print $13}')
housepassed13_first=$(echo $housepassedraw_first | awk '{print $13}')
senatepassed13_first=$(echo $senatepassedraw_first | awk '{print $13}')
enacted13_first=$(echo $enactedraw_first | awk '{print $13}')
url13_first=$(echo $urlraw_first | awk '{print $13}')

echo "$line | $congress13_first | $bill_id13_first | $title13_first | $date13_first | $housepassed13_first | $senatepassed13_first | $enacted13_first | $url13_first"
echo "$line|$congress13_first|$bill_id13_first|$title13_first|$date13_first|$housepassed13_first|$senatepassed13_first|$enacted13_first|$url13_first" >> senate-sponsored.txt

#bill14
bill_id14_first=$(echo $bill_idraw_first | awk '{print $14}')
congress14_first=$(echo $congressraw_first | awk '{print $14}')
title14_first=$(echo $titleraw_first | awk '{print $14}')
date14_first=$(echo $dateraw_first | awk '{print $14}')
housepassed14_first=$(echo $housepassedraw_first | awk '{print $14}')
senatepassed14_first=$(echo $senatepassedraw_first | awk '{print $14}')
enacted14_first=$(echo $enactedraw_first | awk '{print $14}')
url14_first=$(echo $urlraw_first | awk '{print $14}')

echo "$line | $congress14_first | $bill_id14_first | $title14_first | $date14_first | $housepassed14_first | $senatepassed14_first | $enacted14_first | $url14_first"
echo "$line|$congress14_first|$bill_id14_first|$title14_first|$date14_first|$housepassed14_first|$senatepassed14_first|$enacted14_first|$url14_first" >> senate-sponsored.txt

#bill15
bill_id15_first=$(echo $bill_idraw_first | awk '{print $15}')
congress15_first=$(echo $congressraw_first | awk '{print $15}')
title15_first=$(echo $titleraw_first | awk '{print $15}')
date15_first=$(echo $dateraw_first | awk '{print $15}')
housepassed15_first=$(echo $housepassedraw_first | awk '{print $15}')
senatepassed15_first=$(echo $senatepassedraw_first | awk '{print $15}')
enacted15_first=$(echo $enactedraw_first | awk '{print $15}')
url15_first=$(echo $urlraw_first | awk '{print $15}')

echo "$line | $congress15_first | $bill_id15_first | $title15_first | $date15_first | $housepassed15_first | $senatepassed15_first | $enacted15_first | $url15_first"
echo "$line|$congress15_first|$bill_id15_first|$title15_first|$date15_first|$housepassed15_first|$senatepassed15_first|$enacted15_first|$url15_first" >> senate-sponsored.txt

#bill16
bill_id16_first=$(echo $bill_idraw_first | awk '{print $16}')
congress16_first=$(echo $congressraw_first | awk '{print $16}')
title16_first=$(echo $titleraw_first | awk '{print $16}')
date16_first=$(echo $dateraw_first | awk '{print $16}')
housepassed16_first=$(echo $housepassedraw_first | awk '{print $16}')
senatepassed16_first=$(echo $senatepassedraw_first | awk '{print $16}')
enacted16_first=$(echo $enactedraw_first | awk '{print $16}')
url16_first=$(echo $urlraw_first | awk '{print $16}')

echo "$line | $congress16_first | $bill_id16_first | $title16_first | $date16_first | $housepassed16_first | $senatepassed16_first | $enacted16_first | $url16_first"
echo "$line|$congress16_first|$bill_id16_first|$title16_first|$date16_first|$housepassed16_first|$senatepassed16_first|$enacted16_first|$url16_first" >> senate-sponsored.txt

#bill17
bill_id17_first=$(echo $bill_idraw_first | awk '{print $17}')
congress17_first=$(echo $congressraw_first | awk '{print $17}')
title17_first=$(echo $titleraw_first | awk '{print $17}')
date17_first=$(echo $dateraw_first | awk '{print $17}')
housepassed17_first=$(echo $housepassedraw_first | awk '{print $17}')
senatepassed17_first=$(echo $senatepassedraw_first | awk '{print $17}')
enacted17_first=$(echo $enactedraw_first | awk '{print $17}')
url17_first=$(echo $urlraw_first | awk '{print $17}')

echo "$line | $congress17_first | $bill_id17_first | $title17_first | $date17_first | $housepassed17_first | $senatepassed17_first | $enacted17_first | $url17_first"
echo "$line|$congress17_first|$bill_id17_first|$title17_first|$date17_first|$housepassed17_first|$senatepassed17_first|$enacted17_first|$url17_first" >> senate-sponsored.txt

#bill18
bill_id18_first=$(echo $bill_idraw_first | awk '{print $18}')
congress18_first=$(echo $congressraw_first | awk '{print $18}')
title18_first=$(echo $titleraw_first | awk '{print $18}')
date18_first=$(echo $dateraw_first | awk '{print $18}')
housepassed18_first=$(echo $housepassedraw_first | awk '{print $18}')
senatepassed18_first=$(echo $senatepassedraw_first | awk '{print $18}')
enacted18_first=$(echo $enactedraw_first | awk '{print $18}')
url18_first=$(echo $urlraw_first | awk '{print $18}')

echo "$line | $congress18_first | $bill_id18_first | $title18_first | $date18_first | $housepassed18_first | $senatepassed18_first | $enacted18_first | $url18_first"
echo "$line|$congress18_first|$bill_id18_first|$title18_first|$date18_first|$housepassed18_first|$senatepassed18_first|$enacted18_first|$url18_first" >> senate-sponsored.txt

#bill19
bill_id19_first=$(echo $bill_idraw_first | awk '{print $19}')
congress19_first=$(echo $congressraw_first | awk '{print $19}')
title19_first=$(echo $titleraw_first | awk '{print $19}')
date19_first=$(echo $dateraw_first | awk '{print $19}')
housepassed19_first=$(echo $housepassedraw_first | awk '{print $19}')
senatepassed19_first=$(echo $senatepassedraw_first | awk '{print $19}')
enacted19_first=$(echo $enactedraw_first | awk '{print $19}')
url19_first=$(echo $urlraw_first | awk '{print $19}')

echo "$line | $congress19_first | $bill_id19_first | $title19_first | $date19_first | $housepassed19_first | $senatepassed19_first | $enacted19_first | $url19_first"
echo "$line|$congress19_first|$bill_id19_first|$title19_first|$date19_first|$housepassed19_first|$senatepassed19_first|$enacted19_first|$url19_first" >> senate-sponsored.txt

#bill20
bill_id20_first=$(echo $bill_idraw_first | awk '{print $20}')
congress20_first=$(echo $congressraw_first | awk '{print $20}')
title20_first=$(echo $titleraw_first | awk '{print $20}')
date20_first=$(echo $dateraw_first | awk '{print $20}')
housepassed20_first=$(echo $housepassedraw_first | awk '{print $20}')
senatepassed20_first=$(echo $senatepassedraw_first | awk '{print $20}')
enacted20_first=$(echo $enactedraw_first | awk '{print $20}')
url20_first=$(echo $urlraw_first | awk '{print $20}')

echo "$line | $congress20_first | $bill_id20_first | $title20_first | $date20_first | $housepassed20_first | $senatepassed20_first | $enacted20_first | $url20_first"
echo "$line|$congress20_first|$bill_id20_first|$title20_first|$date20_first|$housepassed20_first|$senatepassed20_first|$enacted20_first|$url20_first" >> senate-sponsored.txt

#iterate over pages (up through 43, which would cover 860 bills in a single congress)
for y in {1..75} #563 pre 113th, change to 43 113th and later.
do
z=$(($y * 20))
url="$url_base?offset=$z"

page=$(curl -H 'X-Api-Key: yBBnkhPGVzmNG1IXNP74mVMUNFJa9uHCZBVFspDh' $url | jq '.["results"] | .[].bills')

#all bills
bill_idraw=$(echo $page | jq '.[].bill_id' | sed -e 's/\"//g')
congressraw=$(echo $page | jq '.[].congress' | sed -e 's/\"//g')
titleraw=$(echo -e ${page} | jq '.[].short_title' | sed -e 's/\"//g' -e 's/ /_/g')
dateraw=$(echo $page | jq '.[].introduced_date' | sed -e 's/\"//g')
housepassedraw=$(echo $page | jq '.[].house_passage' | sed -e 's/\"//g')
senatepassedraw=$(echo $page | jq '.[].senate_passage' | sed -e 's/\"//g')
enactedraw=$(echo $page | jq '.[].enacted' | sed -e 's/\"//g')
urlraw=$(echo $page | jq '.[].congressdotgov_url' | sed -e 's/\"//g')

#bill1
bill_id1=$(echo $bill_idraw | awk '{print $1}')
congress1=$(echo $congressraw | awk '{print $1}')
title1=$(echo $titleraw | awk '{print $1}')
date1=$(echo $dateraw | awk '{print $1}')
housepassed1=$(echo $housepassedraw | awk '{print $1}')
senatepassed1=$(echo $senatepassedraw | awk '{print $1}')
enacted1=$(echo $enactedraw | awk '{print $1}')
url1=$(echo $urlraw | awk '{print $1}')

echo "$line | $congress1 | $bill_id1 | $title1 | $date1 | $housepassed1 | $senatepassed1 | $enacted1 | $url1"
echo "$line|$congress1|$bill_id1|$title1|$date1|$housepassed1|$senatepassed1|$enacted1|$url1" >> senate-sponsored.txt

#bill2
bill_id2=$(echo $bill_idraw | awk '{print $2}')
congress2=$(echo $congressraw | awk '{print $2}')
title2=$(echo $titleraw | awk '{print $2}')
date2=$(echo $dateraw | awk '{print $2}')
housepassed2=$(echo $housepassedraw | awk '{print $2}')
senatepassed2=$(echo $senatepassedraw | awk '{print $2}')
enacted2=$(echo $enactedraw | awk '{print $2}')
url2=$(echo $urlraw | awk '{print $2}')

echo "$line | $congress2 | $bill_id2 | $title2 | $date2 | $housepassed2 | $senatepassed2 | $enacted2 | $url2"
echo "$line|$congress2|$bill_id2|$title2|$date2|$housepassed2|$senatepassed2|$enacted2|$url2" >> senate-sponsored.txt

#bill3
bill_id3=$(echo $bill_idraw | awk '{print $3}')
congress3=$(echo $congressraw | awk '{print $3}')
title3=$(echo $titleraw | awk '{print $3}')
date3=$(echo $dateraw | awk '{print $3}')
housepassed3=$(echo $housepassedraw | awk '{print $3}')
senatepassed3=$(echo $senatepassedraw | awk '{print $3}')
enacted3=$(echo $enactedraw | awk '{print $3}')
url3=$(echo $urlraw | awk '{print $3}')

echo "$line | $congress3 | $bill_id3 | $title3 | $date3 | $housepassed3 | $senatepassed3 | $enacted3 | $url3"
echo "$line|$congress3|$bill_id3|$title3|$date3|$housepassed3|$senatepassed3|$enacted3|$url3" >> senate-sponsored.txt

#bill4
bill_id4=$(echo $bill_idraw | awk '{print $4}')
congress4=$(echo $congressraw | awk '{print $4}')
title4=$(echo $titleraw | awk '{print $4}')
date4=$(echo $dateraw | awk '{print $4}')
housepassed4=$(echo $housepassedraw | awk '{print $4}')
senatepassed4=$(echo $senatepassedraw | awk '{print $4}')
enacted4=$(echo $enactedraw | awk '{print $4}')
url4=$(echo $urlraw | awk '{print $4}')

echo "$line | $congress4 | $bill_id4 | $title4 | $date4 | $housepassed4 | $senatepassed4 | $enacted4 | $url4"
echo "$line|$congress4|$bill_id4|$title4|$date4|$housepassed4|$senatepassed4|$enacted4|$url4" >> senate-sponsored.txt

#bill5
bill_id5=$(echo $bill_idraw | awk '{print $5}')
congress5=$(echo $congressraw | awk '{print $5}')
title5=$(echo $titleraw | awk '{print $5}')
date5=$(echo $dateraw | awk '{print $5}')
housepassed5=$(echo $housepassedraw | awk '{print $5}')
senatepassed5=$(echo $senatepassedraw | awk '{print $5}')
enacted5=$(echo $enactedraw | awk '{print $5}')
url5=$(echo $urlraw | awk '{print $5}')

echo "$line | $congress5 | $bill_id5 | $title5 | $date5 | $housepassed5 | $senatepassed5 | $enacted5 | $url5"
echo "$line|$congress5|$bill_id5|$title5|$date5|$housepassed5|$senatepassed5|$enacted5|$url5" >> senate-sponsored.txt

#bill6
bill_id6=$(echo $bill_idraw | awk '{print $6}')
congress6=$(echo $congressraw | awk '{print $6}')
title6=$(echo $titleraw | awk '{print $6}')
date6=$(echo $dateraw | awk '{print $6}')
housepassed6=$(echo $housepassedraw | awk '{print $6}')
senatepassed6=$(echo $senatepassedraw | awk '{print $6}')
enacted6=$(echo $enactedraw | awk '{print $6}')
url6=$(echo $urlraw | awk '{print $6}')

echo "$line | $congress6 | $bill_id6 | $title6 | $date6 | $housepassed6 | $senatepassed6 | $enacted6 | $url6"
echo "$line|$congress6|$bill_id6|$title6|$date6|$housepassed6|$senatepassed6|$enacted6|$url6" >> senate-sponsored.txt

#bill7
bill_id7=$(echo $bill_idraw | awk '{print $7}')
congress7=$(echo $congressraw | awk '{print $7}')
title7=$(echo $titleraw | awk '{print $7}')
date7=$(echo $dateraw | awk '{print $7}')
housepassed7=$(echo $housepassedraw | awk '{print $7}')
senatepassed7=$(echo $senatepassedraw | awk '{print $7}')
enacted7=$(echo $enactedraw | awk '{print $7}')
url7=$(echo $urlraw | awk '{print $7}')

echo "$line | $congress7 | $bill_id7 | $title7 | $date7 | $housepassed7 | $senatepassed7 | $enacted7 | $url7"
echo "$line|$congress7|$bill_id7|$title7|$date7|$housepassed7|$senatepassed7|$enacted7|$url7" >> senate-sponsored.txt

#bill8
bill_id8=$(echo $bill_idraw | awk '{print $8}')
congress8=$(echo $congressraw | awk '{print $8}')
title8=$(echo $titleraw | awk '{print $8}')
date8=$(echo $dateraw | awk '{print $8}')
housepassed8=$(echo $housepassedraw | awk '{print $8}')
senatepassed8=$(echo $senatepassedraw | awk '{print $8}')
enacted8=$(echo $enactedraw | awk '{print $8}')
url8=$(echo $urlraw | awk '{print $8}')

echo "$line | $congress8 | $bill_id8 | $title8 | $date8 | $housepassed8 | $senatepassed8 | $enacted8 | $url8"
echo "$line|$congress8|$bill_id8|$title8|$date8|$housepassed8|$senatepassed8|$enacted8|$url8" >> senate-sponsored.txt

#bill9
bill_id9=$(echo $bill_idraw | awk '{print $9}')
congress9=$(echo $congressraw | awk '{print $9}')
title9=$(echo $titleraw | awk '{print $9}')
date9=$(echo $dateraw | awk '{print $9}')
housepassed9=$(echo $housepassedraw | awk '{print $9}')
senatepassed9=$(echo $senatepassedraw | awk '{print $9}')
enacted9=$(echo $enactedraw | awk '{print $9}')
url9=$(echo $urlraw | awk '{print $9}')

echo "$line | $congress9 | $bill_id9 | $title9 | $date9 | $housepassed9 | $senatepassed9 | $enacted9 | $url9"
echo "$line|$congress9|$bill_id9|$title9|$date9|$housepassed9|$senatepassed9|$enacted9|$url9" >> senate-sponsored.txt

#bill10
bill_id10=$(echo $bill_idraw | awk '{print $10}')
congress10=$(echo $congressraw | awk '{print $10}')
title10=$(echo $titleraw | awk '{print $10}')
date10=$(echo $dateraw | awk '{print $10}')
housepassed10=$(echo $housepassedraw | awk '{print $10}')
senatepassed10=$(echo $senatepassedraw | awk '{print $10}')
enacted10=$(echo $enactedraw | awk '{print $10}')
url10=$(echo $urlraw | awk '{print $10}')

echo "$line | $congress10 | $bill_id10 | $title10 | $date10 | $housepassed10 | $senatepassed10 | $enacted10 | $url10"
echo "$line|$congress10|$bill_id10|$title10|$date10|$housepassed10|$senatepassed10|$enacted10|$url10" >> senate-sponsored.txt

#bill11
bill_id11=$(echo $bill_idraw | awk '{print $11}')
congress11=$(echo $congressraw | awk '{print $11}')
title11=$(echo $titleraw | awk '{print $11}')
date11=$(echo $dateraw | awk '{print $11}')
housepassed11=$(echo $housepassedraw | awk '{print $11}')
senatepassed11=$(echo $senatepassedraw | awk '{print $11}')
enacted11=$(echo $enactedraw | awk '{print $11}')
url11=$(echo $urlraw | awk '{print $11}')

echo "$line | $congress11 | $bill_id11 | $title11 | $date11 | $housepassed11 | $senatepassed11 | $enacted11 | $url11"
echo "$line|$congress11|$bill_id11|$title11|$date11|$housepassed11|$senatepassed11|$enacted11|$url11" >> senate-sponsored.txt

#bill12
bill_id12=$(echo $bill_idraw | awk '{print $12}')
congress12=$(echo $congressraw | awk '{print $12}')
title12=$(echo $titleraw | awk '{print $12}')
date12=$(echo $dateraw | awk '{print $12}')
housepassed12=$(echo $housepassedraw | awk '{print $12}')
senatepassed12=$(echo $senatepassedraw | awk '{print $12}')
enacted12=$(echo $enactedraw | awk '{print $12}')
url12=$(echo $urlraw | awk '{print $12}')

echo "$line | $congress12 | $bill_id12 | $title12 | $date12 | $housepassed12 | $senatepassed12 | $enacted12 | $url12"
echo "$line|$congress12|$bill_id12|$title12|$date12|$housepassed12|$senatepassed12|$enacted12|$url12" >> senate-sponsored.txt

#bill13
bill_id13=$(echo $bill_idraw | awk '{print $13}')
congress13=$(echo $congressraw | awk '{print $13}')
title13=$(echo $titleraw | awk '{print $13}')
date13=$(echo $dateraw | awk '{print $13}')
housepassed13=$(echo $housepassedraw | awk '{print $13}')
senatepassed13=$(echo $senatepassedraw | awk '{print $13}')
enacted13=$(echo $enactedraw | awk '{print $13}')
url13=$(echo $urlraw | awk '{print $13}')

echo "$line | $congress13 | $bill_id13 | $title13 | $date13 | $housepassed13 | $senatepassed13 | $enacted13 | $url13"
echo "$line|$congress13|$bill_id13|$title13|$date13|$housepassed13|$senatepassed13|$enacted13|$url13" >> senate-sponsored.txt

#bill14
bill_id14=$(echo $bill_idraw | awk '{print $14}')
congress14=$(echo $congressraw | awk '{print $14}')
title14=$(echo $titleraw | awk '{print $14}')
date14=$(echo $dateraw | awk '{print $14}')
housepassed14=$(echo $housepassedraw | awk '{print $14}')
senatepassed14=$(echo $senatepassedraw | awk '{print $14}')
enacted14=$(echo $enactedraw | awk '{print $14}')
url14=$(echo $urlraw | awk '{print $14}')

echo "$line | $congress14 | $bill_id14 | $title14 | $date14 | $housepassed14 | $senatepassed14 | $enacted14 | $url14"
echo "$line|$congress14|$bill_id14|$title14|$date14|$housepassed14|$senatepassed14|$enacted14|$url14" >> senate-sponsored.txt

#bill15
bill_id15=$(echo $bill_idraw | awk '{print $15}')
congress15=$(echo $congressraw | awk '{print $15}')
title15=$(echo $titleraw | awk '{print $15}')
date15=$(echo $dateraw | awk '{print $15}')
housepassed15=$(echo $housepassedraw | awk '{print $15}')
senatepassed15=$(echo $senatepassedraw | awk '{print $15}')
enacted15=$(echo $enactedraw | awk '{print $15}')
url15=$(echo $urlraw | awk '{print $15}')

echo "$line | $congress15 | $bill_id15 | $title15 | $date15 | $housepassed15 | $senatepassed15 | $enacted15 | $url15"
echo "$line|$congress15|$bill_id15|$title15|$date15|$housepassed15|$senatepassed15|$enacted15|$url15" >> senate-sponsored.txt

#bill16
bill_id16=$(echo $bill_idraw | awk '{print $16}')
congress16=$(echo $congressraw | awk '{print $16}')
title16=$(echo $titleraw | awk '{print $16}')
date16=$(echo $dateraw | awk '{print $16}')
housepassed16=$(echo $housepassedraw | awk '{print $16}')
senatepassed16=$(echo $senatepassedraw | awk '{print $16}')
enacted16=$(echo $enactedraw | awk '{print $16}')
url16=$(echo $urlraw | awk '{print $16}')

echo "$line | $congress16 | $bill_id16 | $title16 | $date16 | $housepassed16 | $senatepassed16 | $enacted16 | $url16"
echo "$line|$congress16|$bill_id16|$title16|$date16|$housepassed16|$senatepassed16|$enacted16|$url16" >> senate-sponsored.txt

#bill17
bill_id17=$(echo $bill_idraw | awk '{print $17}')
congress17=$(echo $congressraw | awk '{print $17}')
title17=$(echo $titleraw | awk '{print $17}')
date17=$(echo $dateraw | awk '{print $17}')
housepassed17=$(echo $housepassedraw | awk '{print $17}')
senatepassed17=$(echo $senatepassedraw | awk '{print $17}')
enacted17=$(echo $enactedraw | awk '{print $17}')
url17=$(echo $urlraw | awk '{print $17}')

echo "$line | $congress17 | $bill_id17 | $title17 | $date17 | $housepassed17 | $senatepassed17 | $enacted17 | $url17"
echo "$line|$congress17|$bill_id17|$title17|$date17|$housepassed17|$senatepassed17|$enacted17|$url17" >> senate-sponsored.txt

#bill18
bill_id18=$(echo $bill_idraw | awk '{print $18}')
congress18=$(echo $congressraw | awk '{print $18}')
title18=$(echo $titleraw | awk '{print $18}')
date18=$(echo $dateraw | awk '{print $18}')
housepassed18=$(echo $housepassedraw | awk '{print $18}')
senatepassed18=$(echo $senatepassedraw | awk '{print $18}')
enacted18=$(echo $enactedraw | awk '{print $18}')
url18=$(echo $urlraw | awk '{print $18}')

echo "$line | $congress18 | $bill_id18 | $title18 | $date18 | $housepassed18 | $senatepassed18 | $enacted18 | $url18"
echo "$line|$congress18|$bill_id18|$title18|$date18|$housepassed18|$senatepassed18|$enacted18|$url18" >> senate-sponsored.txt

#bill19
bill_id19=$(echo $bill_idraw | awk '{print $19}')
congress19=$(echo $congressraw | awk '{print $19}')
title19=$(echo $titleraw | awk '{print $19}')
date19=$(echo $dateraw | awk '{print $19}')
housepassed19=$(echo $housepassedraw | awk '{print $19}')
senatepassed19=$(echo $senatepassedraw | awk '{print $19}')
enacted19=$(echo $enactedraw | awk '{print $19}')
url19=$(echo $urlraw | awk '{print $19}')

echo "$line | $congress19 | $bill_id19 | $title19 | $date19 | $housepassed19 | $senatepassed19 | $enacted19 | $url19"
echo "$line|$congress19|$bill_id19|$title19|$date19|$housepassed19|$senatepassed19|$enacted19|$url19" >> senate-sponsored.txt

#bill20
bill_id20=$(echo $bill_idraw | awk '{print $20}')
congress20=$(echo $congressraw | awk '{print $20}')
title20=$(echo $titleraw | awk '{print $20}')
date20=$(echo $dateraw | awk '{print $20}')
housepassed20=$(echo $housepassedraw | awk '{print $20}')
senatepassed20=$(echo $senatepassedraw | awk '{print $20}')
enacted20=$(echo $enactedraw | awk '{print $20}')
url20=$(echo $urlraw | awk '{print $20}')

echo "$line | $congress20 | $bill_id20 | $title20 | $date20 | $housepassed20 | $senatepassed20 | $enacted20 | $url20"
echo "$line|$congress20|$bill_id20|$title20|$date20|$housepassed20|$senatepassed20|$enacted20|$url20" >> senate-sponsored.txt

done

done <$1


ex members-$1$2.txt <<EOEX
    :%s/null //g
    :%s/null//g
    :x
EOEX
