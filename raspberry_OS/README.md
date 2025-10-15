# 🍓 Raspberry Pi OS Scripts

This directory contains scripts specifically written and configured for use on **Raspberry Pi OS**.

## Scripts

*   `NetworkManager_raspOS.sh`: Configures the OS to use `NetworkManager` for handling network connections, which is often more flexible than the default `dhcpcd` client on headless or server versions.

## Usage

Ensure the script is executable before running:

```bash
chmod +x ./NetworkManager_raspOS.sh

sudo ./NetworkManager_raspOS.sh
```
