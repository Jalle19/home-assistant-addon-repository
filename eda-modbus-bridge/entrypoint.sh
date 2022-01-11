#!/usr/bin/with-contenv bashio

source config.sh

get-config

node --unhandled-rejections=warn /app/eda-modbus-bridge/eda-modbus-bridge.mjs ${CMD_OPTIONS}
