#!/bin/bash

#Counts the sume of the cardinality for all metrics

. config.sh

sum=0

while read metric
do
	metric_name=$(echo $metric | jq -r '.name')
	if [[ $metric_name != kairosdb* ]]
	then
		#echo $metric_name
		num=$(echo $metric | jq "$jq_query")
		sum=$(($sum + $num))
	fi
	
done < metrics_with_tags.json

echo $sum
