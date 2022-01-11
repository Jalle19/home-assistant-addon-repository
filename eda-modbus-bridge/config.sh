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
  local mqttUser
  local mqttPassword
  local mqttPublishInterval

  local httpListenAddress

  modbusDevice=$(bashio::config 'modbus.device' | escape-input)
  modbusSlave=$(bashio::config 'modbus.slave')

  mqttServer=$(bashio::config 'mqtt.server' | escape-input)
  mqttPort=$(bashio::config 'mqtt.port')
  mqttUser=$(bashio::config 'mqtt.username' | escape-input)
  mqttPassword=$(bashio::config 'mqtt.password' | escape-input)
  mqttPublishInterval=$(bashio::config 'mqtt.publish_interval')

  httpListenAddress=$(bashio::config 'http.listen_address' | escape-input)

  bashio::log.info "---------------------------------------------------"
  bashio::log.info "Modbus device: ${modbusDevice}"
  CMD_OPTIONS+=" --device ${modbusDevice}"

  bashio::log.info "Modbus slave: ${modbusSlave}"
  CMD_OPTIONS+=" --modbusSlave ${modbusSlave}"

  if [[ $(bashio::config.true 'http.enabled') ]]; then
    bashio::log.info "HTTP listening on: ${httpListenAddress}"
    CMD_OPTIONS+="  --http true --httpListenAddress $httpListenAddress"
  fi

  if [[ -n "$mqttServer" ]]; then
    CMD_OPTIONS+=" --mqttBrokerUrl mqtt://${mqttServer}:${mqttPort}"
    bashio::log.info "MQTT broker: ${mqttServer}:${mqttPort}"

    if [[ -n "$mqttUser" && -n "$mqttPassword" ]]; then
      CMD_OPTIONS+=" --mqttUser $mqttUser --mqttPassword $mqttPassword"
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
