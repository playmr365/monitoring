# Linux Server Monitoring Scripts

This repository contains scripts for monitoring various aspects of Linux servers and sending notifications to [ntfy](https://ntfy.sh/). Each script can be easily customized according to specific needs, such as setting ntfy URLs and adjusting thresholds for triggering notifications.

## Contents

1. **Certificates**
   - `LECheck.sh`: Script for monitoring the expiration of Let's Encrypt certificates. It will notify you when the certificate is nearing its expiration date.
   
2. **Memory**
   - `ram.sh`: Script for monitoring RAM usage. It sends a notification if memory usage exceeds the set threshold.
   
3. **Disk**
   - `disk.sh`: Script for monitoring disk usage. It alerts you when disk usage surpasses the defined threshold.
   
4. **CPU**
   - `cpu.sh`: Script for monitoring CPU usage. It sends a notification if CPU usage exceeds the set threshold.
   
5. **Applications**
   - `app.sh`: Script for monitoring the running status of specific applications. It notifies you if a specified application stops or is not running.

## Setup

Before using these scripts, a few adjustments are needed:

1. **Setting the ntfy URL**

   In each script, you need to set the URL for sending notifications to ntfy. This URL is set at the end of the CURL command in each script.

   ```bash
   curl -d "Notification message" https://ntfy.sh/your_topic
   ```

2. **Adjusting threshold values**

   In some scripts, it is possible (and recommended) to adjust the threshold values that trigger notifications. These values are set using variables, for example:

   ```bash
   RAM_THRESHOLD=80   # Percentage of RAM usage
   DISK_THRESHOLD=90  # Percentage of disk usage
   CPU_THRESHOLD=75   # Percentage of CPU usage
   CERT_EXPIRY_DAYS=30 # Number of days until certificate expiry
   ```

## Usage

1. **Making scripts executable**

   Ensure the scripts have executable permissions:

   ```bash
   chmod +x LECheck.sh
   chmod +x ram.sh
   chmod +x disk.sh
   chmod +x cpu.sh
   chmod +x app.sh
   ```

2. **Running the scripts**

   The scripts can be run manually or set up as cron jobs for automatic monitoring at regular intervals.

   ```bash
   ./LECheck.sh
   ./ram.sh
   ./disk.sh
   ./cpu.sh
   ./app.sh
   ```

3. **Setting up cron jobs**

   To automate the execution, you can add the scripts to the crontab:

   ```bash
   crontab -e
   ```

   And add the following lines as needed:

   ```bash
   # Check certificate expiration every day at 2:00 AM
   0 2 * * * /path/to/LECheck.sh

   # Check RAM usage every hour
   0 * * * * /path/to/ram.sh

   # Check disk usage every hour
   0 * * * * /path/to/disk.sh

   # Check CPU usage every 15 minutes
   */15 * * * * /path/to/cpu.sh

   # Check application running status every 5 minutes
   */5 * * * * /path/to/app.sh
   ```

## Contributions

If you have any ideas for improvements or have found a bug, feel free to contribute via pull requests or by opening an issue in this repository.
