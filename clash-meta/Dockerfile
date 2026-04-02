FROM golang:1.26.1-alpine AS builder

ARG TAG

ENV CGO_ENABLED=1

RUN apk update && apk add -y git && \
    git clone --single-branch --depth 1 -b ${TAG} https://github.com/MetaCubeX/Clash.Meta.git /meta && \
    cd /meta && \
    go build -tags with_gvisor -trimpath -ldflags "-s -w" -o clash


FROM alpine

LABEL maintainer="leejc"

ENV TZ="Asia/Shanghai"

VOLUME ["/etc/.clash.meta.d"]

EXPOSE 7890 9090

COPY --from=builder /meta/clash /usr/local/bin/clash

RUN apk add --no-cache ca-certificates tzdata iptables curl && \
    chmod +x /usr/local/bin/clash

CMD ["/usr/local/bin/clash", "-d", "/etc/.clash.meta.d"]