#!/bin/bash
set -e
PHPFPM_DATA_DIR="/data"
PHPFPM_LOG_DIR="${PHPFPM_DATA_DIR}/logs"
PHPFPM_USER=""
if ! [[ -d ${PHPFPM_LOG_DIR} ]]; then
mkdir -p ${PHPFPM_LOG_DIR}
fi
mkdir -m 0775 -p /run/php-fpm
chown ${PHPFPM_USER}: /run/php-fpm
# Delete existing /etc/php-fpm and create symlink from data dir with desired content/config etc
if [[ -e /etc/php-fpm ]]; then
rm -rf /etc/php-fpm
ln -s ${PHPFPM_DATA_DIR} /etc/php-fpm
ln -s ${PHPFPM_LOG_DIR} /var/log/php-fpm
fi

echo "The first parameter Dollar 1 is: ${1}" > /tmp/susin.txt
echo "ALL parameters are: ${@}" > /tmp/susin2.txt

#if [[ ${1} == php-fpm || ${1} == $(type -p php-fpm) ]]; then
if [[ -z ${1} ]]; then
    echo "INSIDE IF: The check for if dollar 1 is true; parameter Dollar 1 is: ${1}" > /tmp/susin3.txt
    exec $(type -p php-fpm)
else
    exec "$@"
fi   


