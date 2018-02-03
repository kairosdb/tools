#Set the karios host to run all the scripts against
host=http://print-server:8080

#Set the number of minutes in the past to query the metric_counters for.
minutes_to_query=30

#Tags that do not add to cardinality of the metric.  These tags are
#ignored when calculating cardinality
non_cardinal_tags='{"application":0, "datacenter":0, "dc":0, "environment":0}'

#jq query for counting tag cardinality - no need to touch this
jq_query='.tags | to_entries | map(select(false == (.key | in('$non_cardinal_tags')))) | map(.value | length) | reduce .[] as $count (1; . * $count)'
