#!/bin/bash

# Funkce pro kontrolu stavu služby
check_service_status() {
    service_name="$1"
    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name běží."
    else
curl -d "application ${service_name} is down on server Wazuh-Nethost"  -u server:tFgiwAisLpaU3Cf6shM2YoEAzguP7p4X https://ntfy.slamaci.eu/servery

    fi
}

# Kontrola stavu HAProxy
check_service_status "haproxy"

# Kontrola stavu httpd
#check_service_status "httpd"

#wazuh-indexer wazuh-manager.service wazuh-dashboard.service

# Kontrola stavu  proftpd
#check_service_status "proftpd"
check_service_status "wazuh-indexer"
check_service_status "wazuh-manager"
check_service_status "wazuh-dashboard"
# Kontrola stavu  zabbix agenta
check_service_status "zabbix-agent2"
