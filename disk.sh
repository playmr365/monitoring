#!/bin/bash
hostname=$(hostname)
# Funkce pro získání volného místa v kořenovém adresáři v GB
get_free_space() {
    free_space=$(df -B1G / | awk 'NR==2{print $4}')
    echo "$free_space"
}

# Minimální volné místo v GB
min_free_space=3

# Získání aktuálního volného místa
available_space=$(get_free_space)

# Porovnání s minimální hodnotou a výpis zprávy
if [ "$available_space" -ge "$min_free_space" ]; then
echo "ok"
else
curl -d "Free space on disk is: ${available_space}GB what is under monitored value:5GB on server $hostname"  [ntfy link]

fi
