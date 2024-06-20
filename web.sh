#!/bin/bash

# Funkce pro kontrolu stavu webového serveru
check_web_server_status() {
    server_name="$1"
    response=$(curl -s -o /dev/null -w "%{http_code}" "https://$server_name")
    if [ "$response" -eq 200 ]; then
        echo "Web na $server_name je dostupný (HTTP status $response)."
    else
curl -d "webside ${server_name} response code is ${response} on server Wazuh-Nethost"  -u server:tFgiwAisLpaU3Cf6shM2YoEAzguP7p4X https://ntfy.slamaci.eu/servery
fi
}

# Cesty k .conf souborům pro Apache
conf_files=("/etc/httpd/conf.d/dnschecker.conf")

# Zpracování .conf souborů a zjištění odkazů na weby
for conf_file in "${conf_files[@]}"; do
    server_names=$(grep -E '^ *ServerName' "$conf_file" | awk '{print $2}')
    for server_name in $server_names; do
        check_web_server_status "$server_name"
    done
done
