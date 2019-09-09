FROM openjdk:8-jre-alpine3.8
LABEL maintainer="leejc1994@gmail.com"

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/*


ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8