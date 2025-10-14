# Shell Scripts Collection

A personal collection of utility shell scripts for various system administration, setup, and customization tasks on Debian-based Linux distributions like Ubuntu and Raspberry Pi OS.

## Main Scripts

*   `audio_out.sh`: An interactive script to list and switch between available audio output devices (sinks) using `pactl`.
*   `batt_charge.sh`: A script intended to set the battery charge threshold. *(Note: The script seems incomplete as of the last review).*
*   `carga_control.sh`: Sets the maximum battery charge threshold to a specified percentage (e.g., 80%) to help prolong battery lifespan. Requires `sudo` privileges.
*   `install_fastfetch.sh`: Clones the `fastfetch` repository, installs dependencies, and builds the tool from source.
*   `install_tools.sh`: A comprehensive setup script that installs a wide range of development and command-line tools, including Brave Browser, Fastfetch, Cava, Duf, Rust, Chafa, Zsh with Oh My Zsh, and more.
*   `NetworkManager_raspOS.sh`: Configures Raspberry Pi OS to use NetworkManager by disabling the default `dhcpcd` client.
*   `NetworkManager.sh`: Configures a standard Ubuntu Server to use NetworkManager for network configuration via `nmcli`.
*   `python_env.sh`: An interactive script to create a Python virtual environment in a user-specified path and name.
*   `tmux_setup.sh`: Creates and configures a specific `tmux` session named "chamba" with multiple windows and panes running `btop`, `cava`, `cmatrix`, `speedtest-cli`, and `fastfetch`.
*   `update_images.sh`: An interactive script to set the GNOME desktop wallpaper and update the user's profile picture (`.face` file).

## Directories

*   `ejemplos/`: Contains various example shell scripts for learning and reference purposes. These demonstrate different shell features and commands.
*   `fastfetch/`: Contains the source code for the `fastfetch` system information tool. This appears to be a git submodule or a local copy of the repository.

## Usage

Most scripts are designed to be run directly from the command line. Ensure they have execute permissions:

```bash
chmod +x ./script_name.sh
./script_name.sh
```

**Note:** Some scripts require `sudo` privileges to install software or modify system settings. Please review each script's content before execution to understand what it does.
