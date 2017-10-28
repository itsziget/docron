#!/bin/sh

ZONEINFO_PATH="/usr/share/zoneinfo"

if [ ! -z "${TZ}" ]; then
    TIMEZONE="${TZ}";
fi;

if [ ! -z "${TIMEZONE}" ]; then
    TIMEZONE_PATH="${ZONEINFO_PATH}/${TIMEZONE}";
    if [ -f "${TIMEZONE_PATH}" ]; then
        cp "${TIMEZONE_PATH}" /etc/localtime;
        echo "${TIMEZONE}" > /etc/timezone;
    else
        >&2 echo "File not found ${TIMEZONE_PATH}. Unknown timezone.";
        exit 1;
    fi;
fi;

exec crond -f -L /dev/stdout