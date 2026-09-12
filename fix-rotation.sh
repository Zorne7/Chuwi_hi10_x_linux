#!/bin/bash
# install sensor lib
sudo apt update
sudo apt install iio-sensor-proxy
# install fix
sudo cp files/61-sensor.hwdb /etc/udev/hwdb.d/
# load fix in current session without reboot
sudo systemd-hwdb update
sudo udevadm trigger -v --subsystem-match=iio
sudo systemctl restart iio-sensor-proxy.service
