#!/bin/bash
set -e
#DATA_DIR="/data"
BIND_DATA_DIR="/data"
BIND_LOG_DIR="${BIND_DATA_DIR}/logs"
#mkdir -p ${BIND_DATA_DIR}
if ! [[ -d ${BIND_LOG_DIR} ]]; then
mkdir -p ${BIND_LOG_DIR}
fi

BIND_USER="named"
#/usr/sbin/adduser -D -H ${BIND_USER} # User comes with apk add bind?

mkdir -p /var/named
chown ${BIND_USER} /var/named
mkdir -m 0775 -p /var/run/named
chown root:${BIND_USER} /var/run/named
chown -R root:${BIND_USER} /data
chown -R ${BIND_USER} ${BIND_LOG_DIR}


# Delete existing /etc/bind and create symlink from data dir with desired content/config etc
#if [[ -e /etc/bind ]]; then
rm -rf /etc/bind
ln -s ${BIND_DATA_DIR} /etc/bind
ln -s ${BIND_LOG_DIR} /var/log/named
#while true; do sleep 1000; done

#fi

echo "The first paramenter Dollar 1 is: ${1}" > /tmp/susin.txt
#if [[ -z ${1} ]]; then # Alpine doesn't have bash and [[ is a Bash keyworkd/Extenstion, NOT TRUE, works with ash/sh in Alpine YEAAAH

# while true; do sleep 1000; done
#if [ -z ${1} ]; then 
if [[ ${1} == named || ${1} == $(type -p named) ]]; then
    exec $(type -p named) -4 -u ${BIND_USER} -f
#        sh -c "$(type -p named) -u ${BIND_USER} -g"
else
#    sh -c  "$@"
exec "$@"

fi   


