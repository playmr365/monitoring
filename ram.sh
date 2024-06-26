#!/bin/bash
hostname=$(hostname)
# Hranice dostupné paměti v MB pro upozornění
memory_threshold=2048  # 1 GB

# Získání dostupné paměti v MB pomocí /proc/meminfo
available_memory=$(awk '/MemAvailable/ {print $2 / 1024}' /proc/meminfo)

# Porovnání s hranicí
if (( $(echo "$available_memory > $memory_threshold" | bc -l) )); then
    echo "ok"   
else
curl -d "free RAM is: ${available_memory}MB which is under monitored value 1GB on server $hostname"  [Ntfy link]
fi

