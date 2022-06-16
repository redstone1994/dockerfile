FROM jenkins/jenkins:lts-alpine
LABEL maintainer="leejc1994@gmail.com"

USER root
ARG kubev=v1.23.1

RUN apk upgrade  && apk add --no-cache tzdata libltdl&& \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    fc-cache && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/* && \
    curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${kubev}/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl 
    
USER jenkins
