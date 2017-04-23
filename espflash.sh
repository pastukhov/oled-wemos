#!/bin/bash
if [ $# -eq 0 ]
  then
    echo "Usage $0 firmware"
  else
    esptool.py --port /dev/ttyUSB0 write_flash -fm dio -fs 32m 0x00000  $1
fi