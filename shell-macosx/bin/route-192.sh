#!/usr/bin/env bash

sudo route -n add 192.168.241.0/24 10.0.0.2
status=$?
echo "status: $status"
exit $status
