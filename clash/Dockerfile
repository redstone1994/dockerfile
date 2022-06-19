FROM dreamacro/clash:latest
LABEL maintainer="leejc1994@gmail.com"

RUN echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf && sysctl -p /etc/sysctl.conf
RUN apk add --no-cache iptables

COPY iptables.sh /iptables.sh

ENTRYPOINT[]

