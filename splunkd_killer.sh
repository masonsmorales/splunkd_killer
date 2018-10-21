#!/usr/bin/env bash
# Splunkd process killer script by Mason Morales, Sept 19, 2018
# Use this to kill stale/zombie splunkd processes after a splunk stop has been executed
processes=$(ps aux | grep splunkd -i | grep -v grep | awk -F ' ' '{print $2}' | xargs)
echo "Processes: "$processes
while true; do
  echo 'Killing processes...'
  for i in $processes; do kill -9 $i; done
  echo "Processes Killed: " $processes
done
# Single line version: sudo -u root sh -c "for i in $(ps -ef | egrep '\(splunkd|/opt/splunk/bin/python\)' | grep -v grep | awk '{print $2}'); do kill -9 $i; done"
