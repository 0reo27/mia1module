#!/system/bin/sh
# Please don't hardcode /magisk/modname/... ; instead, please use $MODDIR/...
# This will make your scripts compatible even if Magisk change its mount point in the future
MODDIR=${0%/*}

# This script will be executed in late_start service mode
# More info in the main Magisk thread


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

# Enable the software navbar
# resetprop qemu.hw.mainkeys 0
# Test Code
resetprop qemu.hw.mainkeys 0
