#!/bin/bash

if [ -z "$WAZUH_MANAGER_ADDRESS" ] || [ -z "$WAZUH_API_TOKEN" ]; then
  echo "Не заданы переменные окружения WAZUH_MANAGER_ADDRESS или WAZUH_API_TOKEN."
  exit 1
fi


/var/ossec/bin/agent-auth -m wazuh.manager -p 55000 -A zeek_agent -P eyJhbGciOiJFUzUxMiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJ3YXp1aCIsImF1ZCI6IldhenVoIEFQSSBSRVNUIiwibmJmIjoxNzMzODQ5MDQ0LCJleHAiOjE3MzM4NDk5NDQsInN1YiI6IndhenVoLXd1aSIsInJ1bl9hcyI6ZmFsc2UsInJiYWNfcm9sZXMiOlsxXSwicmJhY19tb2RlIjoid2hpdGUifQ.Ad7EJTZJk77yFkqL6TEOh4Me1toACFQ9uRNUfoohTtgpNAKO-ebvv_VlcoRuKIAXhywBkzGjuWbAi4f9b2cz3WTpAWTdeVgcHhQjDvkqNhVughcRP7Hn9dVPIEjEpnuT9rBBSBuElyUmhLIS7Bw3qm-peNPZaT9nF8qv4jODVa6g6ozx

if [ $? -ne 0 ]; then
  echo "Ошибка при регистрации агента. Проверьте параметры подключения."
  exit 1
fi


/var/ossec/bin/wazuh-agent -f
