# Change log

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
