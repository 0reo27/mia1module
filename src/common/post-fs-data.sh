#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in post-fs-data mode
# More info in the main Magisk thread

# Fix the camera lag.
magiskpolicy --live "allow hal_camera_default surfaceflinger_service service_manager find"

# Remove backlight on capacitive keys.
# If this module is uninstalled, this is reversed. My guess is this file is generated at re/boot.
echo 0 > /sys/devices/soc/leds-qpnp-10/leds/button-backlight/max_brightness
