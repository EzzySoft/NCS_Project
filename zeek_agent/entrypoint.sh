#!/bin/bash

if [ -z "$WAZUH_MANAGER_ADDRESS" ] || [ -z "$WAZUH_API_TOKEN" ]; then
  echo "Не заданы переменные окружения WAZUH_MANAGER_ADDRESS или WAZUH_API_TOKEN."
  exit 1
fi


/var/ossec/bin/agent-auth -m $WAZUH_MANAGER_ADDRESS -p 55000 -A zeek_agent -P $WAZUH_API_TOKEN

if [ $? -ne 0 ]; then
  echo "Ошибка при регистрации агента. Проверьте параметры подключения."
  exit 1
fi


/var/ossec/bin/wazuh-agent -f
