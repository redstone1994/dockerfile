FROM ubuntu:18.04
LABEL maintainer="leejc1994@gmail.com"

ENV TZ=Asia/Shanghai
#禁止tzdata安装时交互
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    tzdata wget \
    && rm -rf /var/lib/apt/lists/*

RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata
    
RUN wget --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -P /usr/local/ \
    https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz && \
    tar -xzf /usr/local/jdk-8u201-linux-x64.tar.gz -C /usr/local/ && \
    rm -rf /usr/local/jdk-8u201-linux-x64.tar.gz

ENV JAVA_HOME=/usr/local/jdk1.8.0_201
ENV PATH=${JAVA_HOME}/bin:$PATH
ENV LANG C.UTF-8
