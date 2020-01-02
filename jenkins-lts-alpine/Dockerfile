FROM jenkins/jenkins:lts-alpine
LABEL maintainer="leejc1994@gmail.com"

USER root
ARG kubev=v1.16.3
COPY simhei.ttf /usr/share/fonts/
COPY simsun.ttc /usr/share/fonts/
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    fc-cache && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/* && \
    curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${kubev}/bin/linux/amd64/kubectl && \ 
    chmod +x /usr/local/bin/kubectl 
    
ENV LANG=C.UTF-8
USER jenkins
