FROM jenkins/jenkins:lts-alpine
LABEL maintainer="leejc1994@gmail.com"

USER root
ARG kubev=v1.22.15

RUN apk upgrade  && apk add --no-cache docker sudo && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    fc-cache && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/* && \
    curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${kubev}/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl


RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apk add --no-cache --virtual build-deps shadow && \
    usermod -aG docker jenkins &&  \
    apk del build-deps


USER jenkins
