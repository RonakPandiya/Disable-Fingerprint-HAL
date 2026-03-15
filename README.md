# Disable Fingerprint HAL for Moto G62 5G (rhodei)

[![Magisk Module](https://img.shields.io/badge/Magisk-Module-00BFA5?style=for-the-badge&logo=magisk)](https://github.com/topics/magisk-module)
[![Android 16](https://img.shields.io/badge/Android-16%20(Project%20Infinity)-3DDC84?style=for-the-badge&logo=android)](https://www.android.com/)
[![Device: Moto G62 5G](https://img.shields.io/badge/Device-Moto%20G62%205G-512BD4?style=for-the-badge&logo=motorola)](https://forum.xda-developers.com/f/moto-g62-5g.12719/)

A Magisk module that disables the fingerprint HAL on Moto G62 5G (rhodei) running Project Infinity / Android 16, specifically designed to fix an **infinite fingerprint HAL retry loop** caused by a physically damaged sensor.

## 📱 Device Information

- **Device:** Moto G62 5G
- **Codename:** rhodei
- **Processor:** Snapdragon 695 (SM6375)
- **ROM:** Project Infinity / Android 16
- **Author:** LittleFellow ([@RonakPandiya](https://github.com/RonakPandiya) | [@little_fellow](https://t.me/little_fellow) on Telegram)

## 🔍 The Problem

A physically damaged fingerprint sensor causes the Fingerprint HAL to enter an infinite retry loop. This manifests as:

- Continuous logcat spam from FingerprintService
- Excessive battery drain
- SystemUI lag or freezes
- BiometricScheduler constantly attempting to start

## 💡 The Solution

This module masks the fingerprint hardware feature by overlaying an empty permission file in Magisk's `system/vendor/etc/permissions/` directory. This prevents:

1. FingerprintService from constructing FingerprintProvider/defaultHIDL
2. BiometricScheduler from attempting to start
3. All fingerprint-related system calls

## ⚙️ How It Works

The module uses Magisk's overlay system to replace the fingerprint permission file:
