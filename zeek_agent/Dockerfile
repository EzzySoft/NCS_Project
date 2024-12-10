FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release software-properties-common apt-transport-https ca-certificates

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --dearmor -o /usr/share/keyrings/wazuh-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/wazuh-archive-keyring.gpg] https://packages.wazuh.com/4.x/apt stable main" | tee /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && \
    apt-get install -y wazuh-agent

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL -L https://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/Release.key | gpg --dearmor -o /etc/apt/keyrings/zeek-archive-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/zeek-archive-keyring.gpg] https://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/ /" | tee /etc/apt/sources.list.d/security:zeek.list && \
    apt-get update && \
    apt-get install -y zeek

RUN apt-get install -y cmake make gcc g++ flex bison libpcap-dev libssl-dev python3 python3-pip zlib1g-dev

RUN pip3 install --upgrade pip

COPY ossec.conf /var/ossec/etc/ossec.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /opt/zeek/logs/current

VOLUME ["/opt/zeek/logs/current"]

ENV WAZUH_MANAGER_ADDRESS=wazuh.manager

ENTRYPOINT ["/entrypoint.sh"]
