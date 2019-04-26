#!/bin/bash

#Pulls list of members from any congress.

#raw curl in case you need it for testing purposes "curl -H 'X-Api-Key: INSERTYOURAPIKEYHERE' https://api.propublica.org/congress/v1/115/house/members.json" where 115 is the congress number

#usage: ./congress-members.sh {congress_number} {house/senate}

#backup old file
cat members-$1$2.txt > members-$1$2.txt
> members-$1$2.txt

#print column names to screen, then to output file
echo "id | firstname middlename lastname | state-district | party | gender | dw_nominate | total_votes | missed_votes | missed_pct | party_line_pct | next_election"
echo "id|firstname middlename lastname|state-district|party|gender|dw_nominate|total_votes|missed_votes|missed_pct|party_line_pct|next_election" >> members-$1$2.txt

url_base="https://api.propublica.org/congress/v1/$1/$2/members.json"

page=$(curl -H 'X-Api-Key: INSERTYOURAPIKEYHERE' $url_base ) #Replace with your API key, available from ProPublica

idraw=$( echo $page | jq '.["results"] | .[].members | .[].id' | sed -e 's/\"//g')
firstnameraw=$( echo -e ${page} | jq '.["results"] | .[].members | .[].first_name' | sed -e 's/\"//g' -e 's/ /_/g')
middlenameraw=$( echo -e ${page} | jq '.["results"] | .[].members | .[].middle_name' | sed -e 's/\"//g' -e 's/ /_/g')
lastnameraw=$( echo -e ${page} | jq '.["results"] | .[].members | .[].last_name' | sed -e 's/\"//g' -e 's/ /_/g')
stateraw=$( echo -e ${page} | jq '.["results"] | .[].members | .[].state' | sed -e 's/\"//g' -e 's/ /_/g')
districtraw=$( echo $page | jq '.["results"] | .[].members | .[].district' | sed -e 's/\"//g')
partyraw=$( echo $page | jq '.["results"] | .[].members | .[].party' | sed -e 's/\"//g')
genderraw=$( echo $page | jq '.["results"] | .[].members | .[].gender' | sed -e 's/\"//g')
dw_nominateraw=$( echo $page | jq '.["results"] | .[].members | .[].dw_nominate' | sed -e 's/\"//g')
total_votesraw=$( echo $page | jq '.["results"] | .[].members | .[].total_votes' | sed -e 's/\"//g')
missed_votesraw=$( echo $page | jq '.["results"] | .[].members | .[].missed_votes' | sed -e 's/\"//g')
next_electionraw=$( echo $page | jq '.["results"] | .[].members | .[].next_election' | sed -e 's/\"//g')
missed_pctraw=$( echo $page | jq '.["results"] | .[].members | .[].missed_pct' | sed -e 's/\"//g')
party_line_pctraw=$( echo $page | jq '.["results"] | .[].members | .[].party_line_pct' | sed -e 's/\"//g')

for i in {1..450} #loop over every member of congress
do

id=$( echo $idraw | awk '{print $'$i'}')
firstname=$( echo $firstnameraw | awk '{print $'$i'}')
middlename=$( echo $middlenameraw | awk '{print $'$i'}')
lastname=$( echo $lastnameraw | awk '{print $'$i'}')
state=$( echo $stateraw | awk '{print $'$i'}')
district=$( echo $districtraw | awk '{print $'$i'}')
party=$( echo $partyraw | awk '{print $'$i'}')
gender=$( echo $genderraw | awk '{print $'$i'}')
dw_nominate=$( echo $dw_nominateraw | awk '{print $'$i'}')
total_votes=$( echo $total_votesraw | awk '{print $'$i'}')
missed_votes=$( echo $missed_votesraw | awk '{print $'$i'}')
next_election=$( echo $next_electionraw | awk '{print $'$i'}')
missed_pct=$( echo $missed_pctraw | awk '{print $'$i'}')
party_line_pct=$( echo $party_line_pctraw | awk '{print $'$i'}')

echo "$id | $firstname $middlename $lastname | $state-$district | $party | $gender | $dw_nominate | $total_votes | $missed_votes | $missed_pct | $party_line_pct | $next_election"
echo "$id|$firstname $middlename $lastname|$state-$district|$party|$gender|$dw_nominate|$total_votes|$missed_votes|$missed_pct|$party_line_pct|$next_election" >> members-$1$2.txt
echo "$id" >> members-$1$2-idsonly.txt

done

ex members-$1$2.txt <<EOEX
    :%s/null //g
    :%s/null//g
    :x
EOEX
