FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl gnupg lsb-release systemctl software-properties-common

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
    echo "deb https://packages.wazuh.com/4.x/apt stable main" > /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && apt-get install -y wazuh-agent

RUN add-apt-repository ppa:zeek/zeek -y && \
    apt-get update && \
    apt-get install -y zeek

RUN apt-get install -y cmake make gcc g++ flex bison libpcap-dev libssl-dev python3 python3-pip zlib1g-dev

RUN pip3 install --upgrade pip

COPY ossec.conf /var/ossec/etc/ossec.conf

CMD ["/bin/sh", "-c", "service wazuh-agent start && zeekctl deploy && tail -f /var/ossec/logs/ossec.log"]
