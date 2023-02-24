#!/bin/bash

domain=$1

if [ -z $1 ]
then
  echo "Please enter your domain: (example.com)\n > "
  read domain
fi

# Update
apt update && apt upgrade -y

# Certification
bash ./src/make_cert.sh

# X-UI
bash ./make-xui-data.sh
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install_en.sh) < xui.data