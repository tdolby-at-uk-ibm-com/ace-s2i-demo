#!/bin/bash

# Designed for openshift S2I builds; the target directory contains the data passed to the runtime container

echo "In ace-build.sh with target directory of $1"

. /opt/ibm/ace-11/server/bin/mqsiprofile

echo "Starting X server for mqsicreatebar"
Xvfb -ac :99 &
export DISPLAY=:99

sleep 5

echo "Running mqsicreatebar"
mqsicreatebar -data . -b /tmp/application.bar -a aceFunction

echo "Unpacking BAR"
mqsicreateworkdir $1/ace-server
mqsibar -c -w $1/ace-server -a /tmp/application.bar
