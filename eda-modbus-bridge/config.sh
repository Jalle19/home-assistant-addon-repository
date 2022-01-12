#!/usr/bin/env bashio
# shellcheck disable=SC2034

# commandline options
declare CMD_OPTIONS=""

# ------------------------------------------------------------------------------
# Read and print config.
# ------------------------------------------------------------------------------
function get-config {
  local mqttServer
  local mqttProtocol
  local mqttSSL
  local mqttPort
  local mqttUsername
  local mqttPassword

  local httpEnabled

  httpEnabled=$(bashio::config 'http.enabled')

  CMD_OPTIONS+=" --device $(bashio::config 'modbus.device' | escape-input)"
  CMD_OPTIONS+=" --modbusSlave $(bashio::config 'modbus.slave')"

  CMD_OPTIONS+=" --http ${httpEnabled}"

  if [[ "$httpEnabled" = "true" ]]; then
    CMD_OPTIONS+=" --httpListenAddress $(bashio::config 'http.listen_address' | escape-input) --httpPort $(bashio::config 'http.listen_port')"
  fi

  if ! bashio::services.available "mqtt"; then
    bashio::log.info "No internal MQTT service found, using addon config"
    mqttServer=$(bashio::config "mqtt.host")
    mqttPort=$(bashio::config mqtt "mqtt.port")
    mqttSSL=$(bashio::config "mqtt.ssl")
    mqttUsername=$(bashio::config "mqtt.username")
    mqttPassword=$(bashio::config "mqtt.password")
  else
    bashio::log.info "MQTT service found, using service config"
    mqttServer=$(bashio::services mqtt "host")
    mqttPort=$(bashio::services mqtt "port")
    mqttSSL=$(bashio::services mqtt "ssl")
    mqttUsername=$(bashio::services mqtt "username")
    mqttPassword=$(bashio::services mqtt "password")
  fi

  if [[ -n "$mqttServer" ]]; then
    mqttProtocol="mqtt"

    if [[ "$mqttSSL" = "true" ]]; then
      mqttProtocol="mqtts"
    fi

    CMD_OPTIONS+=" --mqttBrokerUrl ${mqttProtocol}://${mqttServer}:${mqttPort}"

    if [[ -n "$mqttUsername" && -n "$mqttPassword" ]]; then
      CMD_OPTIONS+=" --mqttUsername $mqttUsername --mqttPassword $mqttPassword"
    fi

    CMD_OPTIONS+=" --mqttPublishInterval $(bashio::config 'mqtt.publish_interval')"
  fi

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
