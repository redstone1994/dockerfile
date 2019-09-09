FROM alpine:3.9
LABEL maintainer="leejc1994@gmail.com"
RUN apk update && apk upgrade

RUN apk --no-cache add ca-certificates tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk && \
    apk add glibc-2.29-r0.apk && \
    wget --no-check-certificate --no-cookies \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz \
    /usr/local/ && \
    tar -xzf jdk-8u201-linux-x64.tar.gz \
    rm -rf /tmp/* /var/cache/apk/* \
            /usr/local/jdk1.8.0_201/COPYRIGHT \
            /usr/local/jdk1.8.0_201/LICENSE \
            /usr/local/jdk1.8.0_201/README.html \
            /usr/local/jdk1.8.0_201/release \
            /usr/local/jdk1.8.0_201/THIRDPARTYLICENSEREADME.txt \
            /usr/local/jdk1.8.0_201/THIRDPARTYLICENSEREADME-JAVAFX.txt \
            /usr/local/jdk1.8.0_201/lib/plugin.jar \
            /usr/local/jdk1.8.0_201/lib/ext/jfxrt.jar \
            /usr/local/jdk1.8.0_201/bin/javaws \
            /usr/local/jdk1.8.0_201/lib/javaws.jar \
            /usr/local/jdk1.8.0_201/lib/desktop \
            /usr/local/jdk1.8.0_201/plugin \
            /usr/local/jdk1.8.0_201/lib/deploy* \
            /usr/local/jdk1.8.0_201/lib/*javafx*\
            /usr/local/jdk1.8.0_201/lib/*jfx* \
            /usr/local/jdk1.8.0_201/lib/amd64/libdecora_sse.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libprism_*.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libfxplugins.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libglass.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libgstreamer-lite.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libjavafx*.so \
            /usr/local/jdk1.8.0_201/lib/amd64/libjfx*.so 

ENV JAVA_HOME=/usr/local/jdk1.8.0_201 \
    CLASSPATH=$JAVA_HOME/bin \
    PATH=.:$JAVA_HOME/bin:$PATH \
    LANG=zh_CN.UTF-8