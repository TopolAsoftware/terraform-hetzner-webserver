#!/bin/bash
#
# Istall Letsencryot certificate
#

[ "${TPA_OWNER}" ] || [ -f ~/.topola ]   && source ~/.topola
[ "${TPA_OWNER}" ] || [ -f /etc/topola ] && source /etc/topola

if [ -z "${TPA_OWNER}" ] || [ -z "${TPA_DOMAIN}" ]; then
  echo ERROR! config file /etc/topola absent!!!
  exit 0
fi

sleep 10

a2enconf web_cert
systemctl reload apache2

# WARNING! To create real certificate remote option from cmd list: --test-cert
certbot certonly --webroot -w /usr/share/apache2/ \
  --test-cert -q -n --manual-public-ip-logging-ok --agree-tos \
  -d ${TPA_DOMAIN} -m ${TPA_OWNER}@${TPA_DOMAIN}

if [ -f /etc/letsencrypt/live/${TPA_DOMAIN}/cert.pem ]; then
  a2enmod ssl
  systemctl reload apache2
fi

exit 0

