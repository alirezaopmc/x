#!/bin/bash

domain=$1

apt install curl socat -y
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --register-account -m xxxx@xxxx.com
~/.acme.sh/acme.sh --issue -d $domain --standalone
mkdir -p /root/certs/$domain
~/.acme.sh/acme.sh --installcert -d $domain --key-file /root/certs/$domain/private.key --fullchain-file /root/certs/$domain/cert.cer