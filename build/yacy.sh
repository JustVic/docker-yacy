#!/bin/bash

set -eo pipefail

ADMIN_PASS=${ADMIN_PASS:-admin}
spinstr='|/-\'

echo "[yacy] Starting YaCy service..."
/etc/init.d/yacy start

echo -n "[yacy] Waiting until YaCy is running..."
while ! netstat -lnt | grep :8090 >/dev/null; do 
  temp=${spinstr#?}
  printf " [%c]  " "$spinstr"
  spinstr=$temp${spinstr%"$temp"}
  sleep 0.25
  printf "\b\b\b\b\b\b"
done;
printf "    \b\b\b\b"

printf "\n[yacy] YaCy is running: "
/usr/share/yacy/bin/passwd.sh ${ADMIN_PASS}

tail -f /var/lib/yacy/LOG/yacy00.log