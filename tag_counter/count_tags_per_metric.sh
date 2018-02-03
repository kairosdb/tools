#!/bin/bash

. config.sh

sum=0
while read metric
do
	metric_name=$(echo $metric | jq -r '.name')
	if [[ $metric_name != kairosdb* ]]
	then
		num=$(echo $metric | jq "$jq_query")
		tags=$(echo $metric | jq -c '.tags | to_entries | map({(.key): .value | length}) | add')
		sum=$(($sum + $num))
		printf "%020d, %s, %s\n" $num $metric_name "$tags"
		#echo "$num,                 $metric_name, $tags"
	fi
	
done < metrics_with_tags.json

echo $sum
