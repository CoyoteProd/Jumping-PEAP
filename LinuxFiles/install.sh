#!/bin/sh

cd /data/ftp/internal_000/wpa_supplicant

# Copy libraries
cp -f libcrypto.so.1.1 /lib
cp -f  libnl.so.1.1.4 /lib
cp -f  libssl.so.1.1 /lib

# Create Symbolic link
ln -f  -s /lib/libnl.so.1.1.4  /lib/libnl.so.1
ln -f  -s /lib/libcrypto.so.1.1  /lib/libcrypto.so.1
ln -f  -s /lib/libssl.so.1.1  /lib/libssl.so.1

# Copy WPA Executable
cp -f  wpa_cli /bin # optional
cp -f  wpa_passphrase /bin # optional
cp -f  wpa_supplicant /bin

# Copy Configuration. Be sure to modify to your network
cp -f  wpa_supplicant.conf /etc

# Copy dhcp client conf file (original default.script is bogus)
cp -f  clientmode.script /usr/share/udhcpc

# Change configuration when user press once power button
cp -f shortpress_1.sh /bin/onoffbutton

# Cleanup
# (todo)if all is ok,
# then delete sources files
rm clientmode.script
rm wpa_supplicant.conf
rm libcrypto.so.1.1
rm libnl.so.1.1.4
rm libssl.so.1.1
rm wpa_cli
rm wpa_passphrase
rm wpa_supplicant
rm shortpress_1.sh
