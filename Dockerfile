FROM python:3.5-slim

MAINTAINER MrRaph_
COPY rootfs/ /

RUN apt-get update && apt-get -y upgrade && \
    apk apt-get install -y --no-install-recommends ca-certificates rsyslog supervisor && \
    chmod +x /my_* && \
    mkdir /etc/my_runonce /etc/my_runalways /etc/container_environment /etc/workaround-docker-2267 /var/log/supervisor && \
    touch /var/log/startup.log && chmod 666 /var/log/startup.log && \
    rm -rf rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# Define default command.
CMD ["/my_init"]
