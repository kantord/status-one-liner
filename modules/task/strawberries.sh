#!/usr/bin/env bash

cache_id=$(echo "taskwarrior_strawberries_$(( $(date +%s) / 3 ))" | md5sum | head -n1 | cut -f1 -d' ')
cache_file="/tmp/$cache_id"

if test -f "$cache_file"; then
	cat $cache_file
	exit 0
fi

printf '%*s' $(task overdue 2>/dev/null | tail -n1 | cut -f1 -d' ') | sed 's/ /🍓/g' > $cache_file 

echo "" >> $cache_file
echo "🥔" >> $cache_file

cat $cache_file

