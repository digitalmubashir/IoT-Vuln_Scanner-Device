#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

sudo apt install git
cd ~
mkdir /home/pi/rpi-scanner
(crontab -l ; echo '@reboot /bin/bash -c ". ~/.bashrc; /home/pi/rpi-scanner/rpi-scan.sh > /tmp/rpi-scanner.txt 2>&1"') | crontab -

read -p "Please enter your email address: " email
# Learned about heredoc magic: https://unix.stackexchange.com/questions/138418/passing-a-variable-to-a-bash-script-that-uses-eof-and-considers-the-variable-a
cat > /home/pi/rpi-scanner/rpi-scan.sh <<'EOF'
#!/usr/bin/env bash

# need to give network interfaces time to come up before starting
sleep 120

EOF

cat >> /home/pi/rpi-scanner/rpi-scan.sh <<EOF
# change me!
email="$email"

EOF

cat >> /home/pi/rpi-scanner/rpi-scan.sh <<'EOF'
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
EOF

chmod +x /home/pi/rpi-scanner/rpi-scan.sh

if ! command -v docker &> /dev/null
then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker pi
fi

sudo docker run hello-world
echo "Installation finished successfully! Plug your RPi into your router with an Ethernet cable and restart it."
