#!/bin/sh
# Shiro in Fuseki 5.2+ fails authenticated requests with "No SessionManager"
# unless session storage is off. The volume keeps the shiro.ini of the first
# start, so add the setting there.
set -e
line='securityManager.subjectDAO.sessionStorageEvaluator.sessionStorageEnabled = false'
file="$FUSEKI_BASE/shiro.ini"
if [ -f "$file" ] && ! grep -qF "$line" "$file"; then
  sed -i "s/^\[main\]\$/[main]\n$line/" "$file"
fi
exec sh /docker-entrypoint.sh "$@"
