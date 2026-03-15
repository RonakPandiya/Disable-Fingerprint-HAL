# Disable Fingerprint HAL (rhodei)

A Magisk module designed to stop the infinite initialization retry loop caused by physically damaged or malfunctioning fingerprint sensors.

By preventing the system from attempting to communicate with the failed hardware, this module eliminates associated logcat spam, unnecessary CPU wakeups, and device heating.

> ⚠️ **Disclaimer**
> This module completely disables all fingerprint functionality. Use this only if your sensor is physically broken or you no longer wish to use biometric authentication.

---

## How It Works

The module utilizes Magisk's overlay system to mask the `android.hardware.fingerprint` feature flag within `system/vendor/etc/permissions/`.

By removing this flag at boot:
- `FingerprintService` does not attempt to construct the `FingerprintProvider`
- The HIDL services (`android.hardware.biometrics.fingerprint@2.1-focalservice` and `ets2`) are never triggered
- The `BiometricScheduler` remains idle, preventing the "retry-on-fail" loop that normally causes high power consumption

---

## Compatibility

| Property | Value |
|---|---|
| Device | Motorola Moto G62 5G (`rhodei`) |
| Chipset | Snapdragon 695 (SM6375) |
| ROMs | Project Infinity (Android 16), most AOSP-based ROMs |
| Android | Tested on Android 16 |

---

## Installation

1. Download the latest `disable-fp-hal-v1.0.zip` from the [Releases](../../releases) section
2. Open the **Magisk App** (or Kitsune Mask / APatch)
3. Go to the **Modules** tab
4. Select **Install from storage** and pick the downloaded ZIP
5. Reboot your device

---

## Verification

After reboot, confirm the module is working:

```bash
# 1. Feature flag should be gone
adb shell pm list features | grep fingerprint
# Expected: no output

# 2. Loop should be dead
adb logcat -d | grep HidlToAidlSensorAdapter
# Expected: no output

# 3. FingerprintService should show nothing
adb shell dumpsys fingerprint 2>/dev/null | head -5
# Expected: empty or "No fingerprint service"
```

---

## FAQ

**Q: Will my battery life improve?**
If your device was previously heating up due to `FingerprintService` retries, you should see a significant improvement in standby battery life and lower idle CPU usage.

**Q: Can I still use Face Unlock?**
Yes. This module only masks the fingerprint flag; other biometric services remain unaffected.

**Q: How do I revert the changes?**
Simply uninstall the module from the Magisk app and reboot.

---

## Credits & Support

- **Author:** LittleFellow
- **Telegram:** [@little_fellow](https://t.me/little_fellow)
- **GitHub:** [RonakPandiya](https://github.com/RonakPandiya)
- **License:** [GPL-3.0](LICENSE)
