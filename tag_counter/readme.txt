The scripts in this folder help you find metrics with high tag cardinality.

These scripts use bash, jq and curl to estimate tag cardinality

1.  Edit config.sh and set the name of the kairos host you want to query
	Also set the minutes to query and tags to ignore
2.  Run get_metric_names.sh to get a list of metric names that will be saved
	in metric_names.txt
3.  Run query_tags.sh, this will go through each metric getting the tags for
	the last day, the output is placed in metrics_with_tags.json.
4.  Run count_tags_per_metric.sh to dump the estimated tag cardinality
	for the metric as well as the counts for each tag.  You can pipe the 
	output of this command to sort to put them in ascending order
