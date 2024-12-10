#!/bin/sh

zeekctl deploy

/usr/bin/wazuh-agent -f
