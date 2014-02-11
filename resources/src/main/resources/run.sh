#!/bin/bash

# Default properties file name
PROPERTYFILE=default.properties

# Base directory - directory where run.bat resides
BASEDIR="$(dirname "$0")"

# Current directory
CURRENTDIR="$(pwd)"

# Path to Java executable
if [ "x$JAVA_HOME" = "x" ]; then
    JAVA_COMMAND="java"
else
    JAVA_COMMAND="$JAVA_HOME/bin/java"
fi

# Include property file if it exists in current or base directory
if [[ -f $CURRENTDIR/$PROPERTYFILE ]]; then
    JAVA_OPTS=-D$PROPERTYFILE=$CURRENTDIR/$PROPERTYFILE
elif [[ -f $BASEDIR/$PROPERTYFILE ]]; then
    JAVA_OPTS=-D$PROPERTYFILE=$BASEDIR/$PROPERTYFILE
fi

# JPDA options
# JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005"

# Set classpath and other JVM properties
JAVA_OPTS="$JAVA_OPTS -ea -cp $BASEDIR/lib/*:$BASEDIR/resources"
