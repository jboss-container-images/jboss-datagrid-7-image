#!/bin/bash

set -e

SCRIPTS_DIR=/tmp/artifacts
DISTRIBUTION_ZIP="jboss-datagrid-7.1.0-server.zip"
DATAGRID_VERSION="7.1.0"

unzip -q $SCRIPTS_DIR/$DISTRIBUTION_ZIP
mv jboss-datagrid-$DATAGRID_VERSION-server $JBOSS_HOME

chown -R jboss:root $JBOSS_HOME
chmod -R g+rwX $JBOSS_HOME

# Enhance standalone.sh to make remote JAVA debugging possible by specifying
# DEBUG=true environment variable
sed -i 's|DEBUG_MODE=false|DEBUG_MODE="${DEBUG:-false}"|' $JBOSS_HOME/bin/standalone.sh
sed -i 's|DEBUG_PORT="8787"|DEBUG_PORT="${DEBUG_PORT:-8787}"|' $JBOSS_HOME/bin/standalone.sh
