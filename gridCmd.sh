#!/bin/bash

# This script can be used to execute shell commands on a list of hosts.
# The list of Hosts can be specified in a separate file.
# 
# Usage: gridCmd.sh "<bash shell command>"
# Example: gridCmd.sh "df -h"


#hostfile=/app/sas/tkgrid/TKGrid/hosts
hosts=(
	"bernzie"
	"heisenberg"
	"mike"
	"teslamate"
)

#for host in `cat $hostfile` ; do
for host in "${hosts[@]}" ; do
	echo "==== $host ====";
	ssh -q $host "$1";
done

