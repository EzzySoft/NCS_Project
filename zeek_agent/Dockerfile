FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl gnupg lsb-release software-properties-common apt-transport-https ca-certificates

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
    echo "deb https://packages.wazuh.com/4.x/apt stable main" > /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && \
    apt-get install -y wazuh-agent

RUN curl -s https://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/Release.key | gpg --dearmor | tee /usr/share/keyrings/zeek-archive-keyring.gpg > /dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/zeek-archive-keyring.gpg] https://download.opensuse.org/repositories/security:/zeek/xUbuntu_20.04/ /" | tee /etc/apt/sources.list.d/security:zeek.list && \
    apt-get update && \
    apt-get install -y zeek

RUN apt-get install -y cmake make gcc g++ flex bison libpcap-dev libssl-dev python3 python3-pip zlib1g-dev

RUN pip3 install --upgrade pip

COPY ossec.conf /var/ossec/etc/ossec.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENV WAZUH_MANAGER_ADDRESS=wazuh.manager

RUN mkdir -p /opt/zeek/logs/current

VOLUME ["/opt/zeek/logs/current"]

ENTRYPOINT ["/entrypoint.sh"]
