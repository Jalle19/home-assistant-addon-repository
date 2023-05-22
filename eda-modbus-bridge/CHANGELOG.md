# Change log

## 1.3.2
- Update to [eda-modbus-bridge 2.3.1](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.3.1)
  * Log stack traces for unknown errors (should help debug https://github.com/Jalle19/home-assistant-addon-repository/issues/17)
  * Use `%` instead of `%H` for MQTT humidity sensor entities (https://github.com/Jalle19/eda-modbus-bridge/issues/64)
  * Fix automatic reconnect to MQTT broker when initial connection attempt fails (https://github.com/Jalle19/eda-modbus-bridge/issues/61)

## 1.3.1
- Fix "s6-overlay-suexec: fatal: can only run as pid 1" error on addon start

## 1.3.0
- Update to [eda-modbus-bridge 2.3.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.3.0)
  * Add initial support for MD automation units (https://github.com/Jalle19/eda-modbus-bridge/issues/58), mainly "eco mode"
  * Add a "known issues" section to the README

## 1.2.1
- Change default publish interval to 60s, see [DOCS.md](https://github.com/Jalle19/home-assistant-addon-repository/blob/main/eda-modbus-bridge/DOCS.md) for more info (https://github.com/Jalle19/home-assistant-addon-repository/issues/14)

## 1.2.0
- Update to [eda-modbus-bridge 2.2.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.2.0)
  * Log attempts to reconnect to the MQTT broker (https://github.com/Jalle19/eda-modbus-bridge/issues/36)
  * Add documentation on how to physically connect to the unit
  * Expose the device state (https://github.com/Jalle19/eda-modbus-bridge/issues/46)
  * Configure entity icons for alarm sensors
  * Move Home Assistant related logic to `homeassistant.mjs`
  * Publish device information over MQTT once only (https://github.com/Jalle19/eda-modbus-bridge/issues/43)

## 1.1.0

- Update to [eda-modbus-bridge 2.1.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.1.0)
    - Add basic test suite
    - Retain MQTT discovery configuration messages (fixes https://github.com/Jalle19/eda-modbus-bridge/issues/29)
    - Publish only changed settings or modes in MQTT callback (fixes https://github.com/Jalle19/eda-modbus-bridge/issues/33)
    - Add alarms support (fixes https://github.com/Jalle19/eda-modbus-bridge/issues/31)
    - Format code using prettier
    - Support running on Node.js 12.x (fixes https://github.com/Jalle19/eda-modbus-bridge/issues/38)

## 1.0.2

- Simplify configuration, use internal MQTT service if available, otherwise use addon config
- Requirement of internal MQTT service removed
- Changes addon config parameter *mqtt.server* to *mqtt.host* to line up MQTT service and addon configuration
- Add MQTT SSL support

## 1.0.1

- Update to [eda-modbus-bridge 2.0.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.0.0)
- Require MQTT service
- Delay startup

## 1.0.0

- Initial release as a proper Home Assistant add-on!
