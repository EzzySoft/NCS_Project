FROM ubuntu:20.04

ENV WAZUH_MANAGER_IP=wazuh.manager
ENV WAZUH_AGENT_NAME=zeek-agent
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies and Wazuh Agent
RUN apt-get update && \
    apt-get install -y curl gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
    echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list && \
    apt-get update && \
    apt-get install -y wazuh-agent && \
    rm -rf /var/lib/apt/lists/*

# Configure Wazuh Agent
RUN sed -i "s/^address=.*/address=$WAZUH_MANAGER_IP/g" /var/ossec/etc/ossec.conf && \
    sed -i "s/^name=.*/name=$WAZUH_AGENT_NAME/g" /var/ossec/etc/ossec.conf

# Add custom configuration for Zeek logs
RUN sed -i '/<localfile>/,/<\/localfile>/d' /var/ossec/etc/ossec.conf && \
    sed -i '/<\/syscheck>/a \
    <localfile>\n\
      <log_format>json</log_format>\n\
      <location>/var/log/zeek/current/*.log</location>\n\
    </localfile>' /var/ossec/etc/ossec.conf

# Command to start Wazuh Agent
CMD ["/var/ossec/bin/wazuh-agentd", "-f"]