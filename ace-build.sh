#!/bin/bash

# Designed for openshift S2I builds; the target directory contains the data passed to the runtime container
# Modified for the hybrid (combined build.run container)

# This should not be needed, but "oc new-app -e LICENSE=accept" isn't getting through to us.
# "s2i build -e LICENSE=accept" works fine . . . 
export LICENSE=accept

echo "In ace-build.sh with target directory of $1"

. /opt/ibm/ace-11/server/bin/mqsiprofile

#echo "Starting X server for mqsicreatebar"
#Xvfb -ac :99 &
#export DISPLAY=:99
#
#sleep 5
#
#echo "Running mqsicreatebar"
#mqsicreatebar -data . -b /tmp/application.bar -a aceFunction

echo "Running mqsipackagebar"
mqsipackagebar -w . -a /tmp/application.bar -k aceFunction

echo "Creating work directory"
# This looks slightly odd, but for some reason with buildah we end up with a userid that can't access /var/mqsi
# and so we redirect the product to a just-about-to-exist workpath.
export MQSI_REGISTRY=$1/ace-server/config
mqsicreateworkdir $1/ace-server

echo "Unpacking BAR"
mqsibar -c -w $1/ace-server -a /tmp/application.bar

