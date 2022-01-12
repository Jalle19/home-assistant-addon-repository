# Change log

This change log is only for the Home Assistant add-on. See the
[eda-modbus-bridge CHANGELOG](https://github.com/Jalle19/eda-modbus-bridge/blob/master/CHANGELOG.md) for changes to the
application itself.

The version number here doesn't necessarily reflect `eda-modbus-bridge`'s version numbering.

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

Initial release as a proper Home Assistant add-on!
