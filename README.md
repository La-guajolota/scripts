# 🐚 Shell Scripts Collection

Welcome to my personal collection of utility shell scripts! This repository is a curated set of tools for system administration, software installation, and daily workflow enhancements, primarily for Debian-based Linux systems.

---

## 🚀 What's Inside?

This repository is organized into several directories, each with its own `README.md` for more specific details.

| Directory                                       | Description                                                                                             |
| ----------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| 📁 [`autmatic_downloads/`](./autmatic_downloads) | Scripts to automatically download and install software and tools. Perfect for bootstrapping a new system. |
| ⚙️ [`usfull_daily_scripts/`](./usfull_daily_scripts) | A collection of helper scripts for common, day-to-day operations and workflow enhancements.             |
| 🍓 [`raspberry_OS/`](./raspberry_OS)             | Scripts specifically written and configured for use on **Raspberry Pi OS**.                               |
| 📂 [`ejemplos/`](./ejemplos)                     | A folder containing various example shell scripts for learning and reference purposes.                  |
| 🏎️ `fastfetch/`                                   | The complete source code for the `fastfetch` system information tool, included as a submodule.          |

### Standalone Scripts

*   `NetworkManager.sh`: 🌐 A script to configure a standard Ubuntu Server to use `NetworkManager`.

---

## 🛠️ Usage

Most scripts are designed to be run directly from the command line. 

1.  **Make the script executable:**
    ```bash
    chmod +x path/to/your/script.sh
    ```

2.  **Run the script:**
    ```bash
    ./path/to/your/script.sh
    ```

> ### ⚠️ **A Word of Caution**
> Many of these scripts require `sudo` privileges to install software or modify system settings. Please **always review the content of a script before executing it** to understand the changes it will make to your system.

---

## 📝 License

This repository is under the [MIT License](./LICENSE).
