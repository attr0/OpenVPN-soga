FROM alpine:latest

WORKDIR /

# install soga
COPY install_soga.sh /install_soga.sh
RUN /bin/sh /install_soga.sh

# install software
RUN true \
    # install openvpn
    && apk add --no-cache openvpn net-tools openresolv openrc tzdata bash \
    # clean cache
    && rm -rf /var/cache/apk/* 

# copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT [ \
    "/bin/sh", "-c", \
    "cd / && /usr/sbin/openvpn --config vpn.ovpn --script-security 2 --up /start.sh" \
    ]