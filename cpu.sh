#!/bin/bash

# Hranice vytížení CPU pro upozornění (v procentech)
cpu_threshold=70

# Získání aktuálního vytížení CPU pomocí top
cpu_idle=$(mpstat | grep -oE '[0-9]+\.[0-9]+' |tail -1)
cpu_usage=$(echo "100 - $cpu_idle" | bc)
# Porovnání s hranicí
if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
curl -d "CPU Utlilization is ${cpu_usage}% on server Wazuh-Nethost"  -u server:tFgiwAisLpaU3Cf6shM2YoEAzguP7p4X https://ntfy.slamaci.eu/servery
#e lse
fi

