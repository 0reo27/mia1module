#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread


# ========================================
# NO SIM Card Fix
# This does infact work but the issue with
# the mi A1 relies on the baseband.
# There is an error where the IMEI would
# show as blank. No known fix yet.
# =======================================
# SIM 1
service call phone 158 i32 0 i32 1
# SIM 2
service call phone 158 i32 1 i32 1


# ========================================
# Camera Fixes
# ========================================

# Enable Camera 2 API
resetprop persist.camera.HAL3.enabled 1

# Enable EIS
resetprop persist.camera.eis.enable 1

# ========================================
# Other Fixes
# ========================================

# Enable Noise Cancellation
resetprop ro.vendor.audio.sdk.fluencetype fluencepro

# ========================================
# Custom Features
# ========================================

# Requires kernel support
# Set a comfortable vibration level.
echo 2030 > /sys/devices/virtual/timed_output/vibrator/vtg_level

# Enable the software navbar
# resetprop qemu.hw.mainkeys 0
# Test Code
resetprop qemu.hw.mainkeys 0

# Set the default Tones
resetprop ro.config.ringtone=The_big_adventure.ogg
resetprop ro.config.notification_sound=Popcorn.ogg
resetprop ro.config.alarm_alert=Alarm_Buzzer.ogg
# A bug occurs that changes the ring and alarm tones on module uninstall, change the settings programtically.
currentTone=$(settings get system ringtone)
if [ "$currentTone" = content://media/internal/audio/media/406 ]
then
    settings put system ringtone content://media/internal/audio/media/406
    settings put system notification_sound content://media/internal/audio/media/395
fi