#!/usr/bin/env bash

# Setup common config
export LOG_LEVEL="${LOG_LEVEL:-INFO}"
export SPRING_PROFILES_ACTIVE="docker"

# Setup DB config
export DB_TYPE="${DB_TYPE:-mysql}"
export DB_HOST="${DB_HOST:-${DB_TYPE}}"
export DB_NAME="${DB_NAME:-petclinic}"
export DB_URL="${DB_URL:-jdbc:${DB_TYPE}://${DB_HOST}/${DB_NAME}}"
export DB_USER="${DB_USER:-root}"
export DB_PASSWORD="${DB_PASSWORD:-petclinic}"

# Configure java options
[[ "$JAVA_MEM_MIN" ]] && JAVA_OPTIONS+=" -Xmx${JAVA_MEM_MIN}"
[[ "$JAVA_MEM_MAX" ]] && JAVA_OPTIONS+=" -Xmx${JAVA_MEM_MAX}"

# Start the app
java $JAVA_OPTIONS -jar /*.jar $@
