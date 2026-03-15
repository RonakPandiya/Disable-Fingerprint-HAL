#!/system/bin/sh
SKIPUNZIP=0
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "  Disable Fingerprint HAL (rhodei)"
ui_print "  Stable Release v1.0"
ui_print "  Author  : LittleFellow"
ui_print "  GitHub  : https://github.com/RonakPandiya"
ui_print "  Telegram: @little_fellow"
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print " Device : Moto G62 5G (rhodei / SM6375)"
ui_print " ROM    : Project Infinity / Android 16"
ui_print " Fix    : Masks android.hardware.fingerprint"
ui_print "          via system/vendor permissions overlay"
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
set_perm_recursive "$MODPATH" 0 0 0755 0644
ui_print " [!] Reboot required."
ui_print " [!] Fingerprint in Settings will vanish — expected."
ui_print " [!] To reverse: remove module in Magisk and reboot."
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
