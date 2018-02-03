#!/bin/bash

. config.sh

while read metric
do
	echo "${metric}"

	#FILE=$1

	data="{\"metrics\": [{\"name\": \"${metric}\"}],\"cache_time\": 0,\"limit\":1,\"start_relative\": {\"value\": \"1\", \"unit\": \"days\"} }"

	curl -X POST --data "$data" --header "Content-Type: application/json" $host/api/v1/datapoints/query/tags | jq -c '.queries[].results[] | {name: .name, tags: .tags}' >> metrics_with_tags.json
	
done <metric_names.txt
