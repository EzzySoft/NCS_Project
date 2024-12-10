#!/bin/sh
zeekctl deploy || true

/var/ossec/bin/wazuh-agent -f
