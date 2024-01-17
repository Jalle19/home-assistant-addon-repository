# Change log

## 1.6.1
- Update to [eda-modbus-bridge 2.7.1](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.7.1)
  * Fix reading from unit type from wrong register (https://github.com/Jalle19/eda-modbus-bridge/issues/100)

## 1.6.0
- Update to [eda-modbus-bridge 2.7.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.7.0)
  * Add Modbus TCP support (https://github.com/Jalle19/eda-modbus-bridge/issues/86)
  * Expose "room temperature average" if available (https://github.com/Jalle19/eda-modbus-bridge/issues/88)
  * Expose optional analog inputs (CO2, RH, and room temperature sensors) if available (https://github.com/Jalle19/eda-modbus-bridge/issues/88)
  * Fix device type (Pro/Family) parsing (https://github.com/Jalle19/eda-modbus-bridge/issues/89)
  * Parse pro unit size correctly
  * Change Home Assistant auto-discovery log level to `debug` (https://github.com/Jalle19/eda-modbus-bridge/issues/93)
  * Add settings switches for cooling/heating allowed (https://github.com/Jalle19/eda-modbus-bridge/issues/98)
  * Publish all MQTT values immediately during startup, don't wait until the first scheduled update

## 1.5.0
- Update to [eda-modbus-bridge 2.5.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.5.0)
  * Bump `serialport` to v11.0.1, should fix runtime crash on Raspberry Pi 4 (https://github.com/Jalle19/home-assistant-addon-repository/issues/30)
  * Bump minimum required Node.js version to 14.x
- Use Debian base images instead of Alpine Linux

## 1.4.0
- Update to [eda-modbus-bridge 2.4.0](https://github.com/Jalle19/eda-modbus-bridge/releases/tag/2.4.0)
  * Drastically improve application logging
  * Add missing error handling to the `/summary` route, change HTTP error responses to return JSON
  * Add `-v` option which enables debug logging
  * Start using ESLint, add `no-console` rule to enforce use of logger instances
  * Include the unit's Modbus address in the device information
  * Add a section about older software versions to the README
- Add a new `logging.debug` option for controlling debug logging (https://github.com/Jalle19/home-assistant-addon-repository/issues/27)
- Fix deprecation warning when installing dependencies (https://github.com/Jalle19/home-assistant-addon-repository/issues/25)

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
