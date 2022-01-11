#!/usr/bin/env bashio
# shellcheck disable=SC2034

# commandline options
declare CMD_OPTIONS=""

# ------------------------------------------------------------------------------
# Read and print config.
# ------------------------------------------------------------------------------
function get-config {
  bashio::log.info "Init config"

  local modbusDevice
  local modbusSlave

  local mqttServer
  local mqttPort
  local mqttUsername
  local mqttPassword
  local mqttPublishInterval

  local httpEnabled
  local httpListenAddress
  local httpListenPort

  modbusDevice=$(bashio::config 'modbus.device' | escape-input)
  modbusSlave=$(bashio::config 'modbus.slave')

  mqttServer=$(bashio::config 'mqtt.server' | escape-input)
  mqttPort=$(bashio::config 'mqtt.port')
  mqttUsername=$(bashio::config 'mqtt.username' | escape-input)
  mqttPassword=$(bashio::config 'mqtt.password' | escape-input)
  mqttPublishInterval=$(bashio::config 'mqtt.publish_interval')

  httpEnabled=$(bashio::config 'http.enabled')
  httpListenAddress=$(bashio::config 'http.listen_address' | escape-input)
  httpListenPort=$(bashio::config 'http.listen_port')

  bashio::log.info "---------------------------------------------------"
  bashio::log.info "Modbus device: ${modbusDevice}"
  CMD_OPTIONS+=" --device ${modbusDevice}"

  bashio::log.info "Modbus slave: ${modbusSlave}"
  CMD_OPTIONS+=" --modbusSlave ${modbusSlave}"

  CMD_OPTIONS+=" --http ${httpEnabled}"

  if [[ "$httpEnabled" = "true" ]]; then
    bashio::log.info "HTTP listening on: ${httpListenAddress}:${httpListenPort}"
    CMD_OPTIONS+=" --httpListenAddress $httpListenAddress --httpPort $httpListenPort"
  fi

  if [[ -n "$mqttServer" ]]; then
    CMD_OPTIONS+=" --mqttBrokerUrl mqtt://${mqttServer}:${mqttPort}"
    bashio::log.info "MQTT broker: ${mqttServer}:${mqttPort}"

    if [[ -n "$mqttUsername" && -n "$mqttPassword" ]]; then
      CMD_OPTIONS+=" --mqttUsername $mqttUsername --mqttPassword $mqttPassword"
      bashio::log.info "MQTT: using credentials"
    else
      bashio::log.info "MQTT: anonymous login"
    fi

    CMD_OPTIONS+=" --mqttPublishInterval ${mqttPublishInterval}"
    bashio::log.info "MQTT publish interval: ${mqttPublishInterval}"
  else
    bashio::log.info "MQTT: disabled"
  fi

  bashio::log.info "---------------------------------------------------"

  return 0
}

# ------------------------------------------------------------------------------
# Escape input given by the user.
#
# Returns the escaped string on stdout
# ------------------------------------------------------------------------------
function escape-input {
  local input
  read -r input

  # escape the evil dollar sign
  input=${input//$/\\$}

  echo "$input"
}
