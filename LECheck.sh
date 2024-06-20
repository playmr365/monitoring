#!/bin/bash

# Počet dní, před kterými má proběhnout kontrola default: 20
dias_antes=20

#Načtení potřebních proměných
current_time=$(date -u +"%Y-%m-%dT%H:%M:%S.%3NZ")
name=$(hostname)
certbot_output=$(sudo certbot certificates 2>/dev/null)

function print_certificate_info() {
curl -d "Blíží se expirace certifikátu domény: ${2}, k expiraci dojde za: ${1} dní on server Wazuh-Nethost"  -u server:tFgiwAisLpaU3Cf6shM2YoEAzguP7p4X https://ntfy.Wazuh-Nethost/servery
} 

#kontrola expirace certifikátů
while read -r line; do
    if [[ $line == *"Expiry Date:"* ]]; then
        expiry_date=$(echo "$line" | awk -F': ' '{print $2}')
        expiry_timestamp=$(date -d "$expiry_date" +"%s")
        current_timestamp=$(date +"%s")
        time_diff=$((expiry_timestamp - current_timestamp))
        days_diff=$((time_diff / 86400))

        if [ "$days_diff" -lt "$dias_antes" ]; then
            cert_name=$(echo "$prev_line" | awk -F': ' '{print $2}')
            print_certificate_info "$days_diff" "$cert_name" "$expiry_date"
        fi
    fi
    prev_line=$line
done <<< "$certbot_output"
