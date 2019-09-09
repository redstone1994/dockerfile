FROM jenkins/jenkins:lts-alpine
LABEL maintainer="leejc1994@gmail.com"

USER root
COPY simhei.ttf /usr/share/fonts/
COPY simsun.ttc /usr/share/fonts/
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    fc-cache && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/*
    
ENV LANG zh_CN.UTF-8
USER jenkins
