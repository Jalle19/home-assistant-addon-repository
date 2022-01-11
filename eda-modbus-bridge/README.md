# eda-modbus-bridge

> I take no responsibility if you break your ventilation unit by using this software!

A Modbus MQTT bridge for Enervent ventilation units with EDA automation (e.g. Pingvin). 

Communication happens over RS-485 (Modbus RTU) by connecting a serial device to the "Freeway" port on the ventilation 
unit's computer board.

## Features

## Requirements

* An Enervent Pingvin ventilation unit (other EDA-based units may work, but the Modbus register numbers probably differ)
* An RS-485 device (e.g. `/dev/ttyUSB0`) connected to the Enervent unit's Freeway port
* MQTT broker

## License

GNU GENERAL PUBLIC LICENSE 3.0
