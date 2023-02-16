#!/bin/bash

domain=$1

if [ -z $1 ]
then
  echo "Please enter your domain: (example.com)\n > "
  read domain
fi

# Certification
apt update && apt upgrade -y
apt install curl socat -y
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --register-account -m xxxx@xxxx.com
~/.acme.sh/acme.sh --issue -d $domain --standalone
~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/private.key --fullchain-file /root/cert.cer
cp /root/cert.crt /pb
cp /root/private.key /pv

# X-UI
bash ./make-xui-data.sh
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install_en.sh) < xui.data

# Nginx
apt install nginx
cp ./nginx.conf /etc/nginx/nginx.conf
nginx -s reload
