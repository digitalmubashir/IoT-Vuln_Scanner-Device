#!/usr/bin/env bash

# need to give network interfaces time to come up before starting
sleep 60

# change me!
email=""

#pwd=/home/pi/openvas-docker-lite/rpi
ip_addr=$(/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')
ip_subnet=$(echo $ip_addr | cut -d'.' -f1,2,3)
ip_subnet+=".0/24"
echo "Scanning $ip_subnet..."
curl "https://rpi.pensivesecurity.io/sendstart?recipient=$email"
docker run --rm -v /tmp/:/reports/:rw pensivesecurity/rpi-scanner:latest python3 -u scan.py "$ip_subnet" --debug --update --format="PDF" --output rpi-openvas-report.pdf --profile="Full and fast"
file_url=$(docker run --rm -v /tmp/:/data/ pensivesecurity/ffsend-rpi upload --expiry-time 5d --downloads 5 -q -h https://send.pensivesecurity.io/ rpi-openvas-report.pdf | sed 's,http,https,g')
curl -G \
    --data-urlencode "recipient=$email" \
    --data-urlencode "reporturl=$file_url" \
    https://rpi.pensivesecurity.io/sendresults
