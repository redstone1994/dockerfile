FROM docker:18.06.1-ce-dind

LABEL maintainer="leejc1994@gmail.com"

#RUN echo -e "http://mirrors.aliyun.com/alpine/v3.8/main/\n \
#http://mirrors.aliyun.com/alpine/v3.8/community/" > /etc/apk/repositories

#RUN mkdir -p /etc/docker && echo -e '{"insecure-registries": ["192.168.14.187:2000"]}' > /etc/docker/daemon.json

RUN apk update && apk add -U tzdata openjdk8 maven bash && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -rf /root/.cache && rm -rf /var/cache/apk/*

ENV LANG zh_CN.UTF-8
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin
COPY settings.xml /usr/share/java/maven-3/conf/
CMD ["/bin/bash"]