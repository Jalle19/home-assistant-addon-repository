#!/usr/bin/with-contenv bashio

source config.sh

get-config

node /app/eda-modbus-bridge/dist/eda-modbus-bridge.js ${CMD_OPTIONS}
