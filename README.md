# Shell Scripts Collection

A personal collection of utility shell scripts, organized for various system administration, setup, and daily tasks on Linux.

## Repository Structure

This repository is organized into the following directories:

*   `autmatic_downloads/`: Scripts dedicated to automatically downloading and installing software and tools.
*   `usfull_daily_scripts/`: A collection of scripts for common, day-to-day operations and workflow enhancements.
*   `raspberry_OS/`: Scripts specifically tailored for use on Raspberry Pi OS.
*   `ejemplos/`: A folder containing various example shell scripts for learning and reference.
*   `fastfetch/`: Contains the source code for the `fastfetch` system information tool, likely included as a submodule or vendored code.

## Scripts Overview

### Automatic Downloads (`autmatic_downloads/`)
*   `install_tools.sh`: A comprehensive setup script for installing a wide range of development and command-line tools.
*   `install_fastfetch.sh`: Clones the `fastfetch` repository, installs dependencies, and builds the tool from source.

### Useful Daily Scripts (`usfull_daily_scripts/`)
*   `audio_out.sh`: Interactively switch between different audio output devices.
*   `carga_control.sh`: Set the maximum battery charge threshold to prolong battery life.
*   `python_env.sh`: Interactively create a new Python virtual environment.
*   `tmux_setup.sh`: Creates a pre-configured `tmux` session for a multi-pane workflow.
*   `update_images.sh`: Interactively set the GNOME desktop wallpaper and user profile picture.
*   `usb.sh`: A script to toggle specific GPIO pins, likely to power cycle USB ports on a device like a Raspberry Pi.
*   `usbip-porting.sh`: Initializes the `usbip` kernel modules to allow sharing USB devices over an IP network.

### Raspberry Pi OS (`raspberry_OS/`)
*   `NetworkManager_raspOS.sh`: Configures Raspberry Pi OS to use NetworkManager instead of the default `dhcpcd`.

### Root-level Scripts
*   `NetworkManager.sh`: Configures a standard Ubuntu Server to use NetworkManager.

## Usage

Ensure scripts are executable before running:

```bash
chmod +x path/to/your/script.sh
./path/to/your/script.sh
```

**Note:** Many scripts require `sudo` privileges to perform system-level changes. Please review a script's content before executing it.