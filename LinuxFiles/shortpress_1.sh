#!/bin/sh
# Script called when pressing the ON/OFF button once

# Change by VilCoyote to Connect to Extra Network
echo "Triggered ChangeNetwork" | logger -s -t "ShortPress" -p user.info

/data/ftp/internal_000/wpa_supplicant/wpa2power.sh
