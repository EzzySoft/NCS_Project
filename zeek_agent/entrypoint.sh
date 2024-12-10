#!/bin/bash

if [ -z "$WAZUH_MANAGER_ADDRESS" ] || [ -z "$WAZUH_API_TOKEN" ]; then
  echo "Не заданы переменные окружения WAZUH_MANAGER_ADDRESS или WAZUH_API_TOKEN."
  exit 1
fi


/var/ossec/bin/agent-auth -m wazuh.manager -p 55000 -A zeek_agent -P eyJhbGciOiJFUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3YXp1aCIsImF1ZCI6IldhenVoIEFQSSBSRVNUIiwibmJmIjoxNzMzODUwNjk2LCJleHAiOjE3MzM4NTE1OTYsInN1YiI6IndhenVoLXd1aSIsInJ1bl9hcyI6ZmFsc2UsInJiYWNfcm9sZXMiOlsxXSwicmJhY19tb2RlIjoid2hpdGUifQ.AaXCSRZgHZQhU-C9NnOvC5wHa-OzQnwymfcBUI9jDOxf5Co8HwifaRRkjvmDp5DV6dJ4mA51QhfkJCs8hrevOP6LAXx-z7hqqr9phn5pYIgJn9SUz3f-ez2znsVNjPXeTfB8CRec1Tbfinf_g3G1iiUhQocWh5rfwbTT9t1ZEMVk6vgu

if [ $? -ne 0 ]; then
  echo "Ошибка при регистрации агента. Проверьте параметры подключения."
  exit 1
fi


/var/ossec/bin/wazuh-agent -f
