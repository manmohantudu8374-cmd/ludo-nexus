#!/bin/sh
# Usage: ./set-domain.sh yourdomain.com
[ -z "$1" ] && echo "usage: $0 yourdomain.com" && exit 1
grep -rl "YOUR-DOMAIN.com" . --include=* 2>/dev/null | grep -v '\.png$' | xargs sed -i "s/YOUR-DOMAIN.com/$1/g"
echo "Domain set to $1"
