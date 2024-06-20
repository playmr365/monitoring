#!/bin/bash
hostname=$(hostname)
# Funkce pro kontrolu stavu služby
check_service_status() {
    service_name="$1"
    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name běží."
    else
curl -d "application ${service_name} is down on server $hostname"  [ntfy link]

    fi
}


check_service_status "[APP NAME]"
