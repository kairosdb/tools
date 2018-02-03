#!/bin/bash

. config.sh

#This uses the metric_counters to get currently ingested metric names.
#Output is dumped to metric_names.txt

query="{\"metrics\": [{\"tags\":{},\"name\":\"kairosdb.metric_counters\",\"aggregators\":[{\"name\":\"sum\",\"align_sampling\":true,\"sampling\":{\"value\":\"1\",\"unit\":\"milliseconds\"},\"align_start_time\":false}]}],\"cache_time\": 0,\"start_relative\":{\"value\": \"$minutes_to_query\",\"unit\": \"minutes\"}}"

curl -X POST --data "$query" --header "Content-Type: application/json" $host/api/v1/datapoints/query | jq -r '.queries[0].results[0].tags.metric_name[]' > metric_names.txt
