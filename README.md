# ProPublica's Congress API wrapper scripts

## Description
Shell-script based Webscraper to pull data from [ProPublica's Congress API](https://projects.propublica.org/api-docs/congress-api/), in which you can pull detailed info about members, bills, votes, dw-nominate scores, and sponsorships (among other things).

## Getting started:
* This is written in Bash a unix shell script.  Windows users, you can do this through a Bash for Windows utility (I recommend [Cygwin](https://www.cygwin.com/); it is free and open source)
* This assumes a Unix/Linux based filesystem.  For Windows, change the download and file directories accordingly (specifically, replace the "~" home directory with wherever you are working in Windows).
* You WILL NEED a ProPublica Congress API key to access this API.  [Get a free one from ProPublica's Data Store here](https://www.propublica.org/datastore/api/propublica-congress-api)
* You will need to replace the variables in the script with whatever you want to pull.  Multiple ones can be searched with one run of the script.

## Acknowledgement
* This software can be used for any non-commercial purpose as long as Patrick W. Zimmerman of [Principally Uncertain](https://principallyuncertain.com) is given credit for its creation.  
* More help for digital historians, data journalists, and interested folk can be found by joining the [Digital Historians Slack group](https://forms.gle/hJUGumGie913mn5y7)
