FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
    echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list

RUN apt-get update && \
    apt-get install -y wazuh-agent && \
    rm -rf /var/lib/apt/lists/*

COPY ossec.conf /var/ossec/etc/ossec.conf

CMD ["/var/ossec/bin/ossec-control", "start", "&&", "tail", "-f", "/var/ossec/logs/ossec.log"]
