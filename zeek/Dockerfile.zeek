FROM zeek/zeek:lts

RUN apt-get update && \
    apt-get install -y net-tools iproute2 msmtp mailutils && \
    rm -rf /var/lib/apt/lists/*

CMD ["zeekctl", "deploy"]
