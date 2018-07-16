#!/bin/bash
set -e
NGINX_DATA_DIR="/data"
NGINX_LOG_DIR="${NGINX_DATA_DIR}/logs"
NGINX_USER="nginx"
if ! [[ -d ${NGINX_LOG_DIR} ]]; then
mkdir -p ${NGINX_LOG_DIR}
fi
mkdir -m 0775 -p /run/nginx
chown ${NGINX_USER}: /run/nginx
# Delete existing /etc/nginx and create symlink from data dir with desired content/config etc
if [[ -e /etc/nginx ]]; then
rm -rf /etc/nginx
ln -s ${NGINX_DATA_DIR} /etc/nginx
ln -s ${NGINX_LOG_DIR} /var/log/nginx
fi

echo "The first parameter Dollar 1 is: ${1}" > /tmp/susin.txt
echo "ALL parameters are: ${@}" > /tmp/susin2.txt

#if [[ ${1} == nginx || ${1} == $(type -p nginx) ]]; then
if [[ -z ${1} ]]; then
    echo "INSIDE IF: The check for if dollar 1 is true; parameter Dollar 1 is: ${1}" > /tmp/susin3.txt
    #    exec $(type -p nginx)
      $(type -p nginx)
    else
	#exec "$@"
	 "$@"
fi   


