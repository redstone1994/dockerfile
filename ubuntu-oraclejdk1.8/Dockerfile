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
    -O /usr/local/jdk-8u231-linux-x64.tar.gz \
    https://download.oracle.com/otn/java/jdk/8u231-b11/5b13a193868b4bf28bcb45c792fce896/jdk-8u231-linux-x64.tar.gz?AuthParam=1575372748_0f70e64ca444b3882c78659f7a9193f6 && \
    tar -xzf /usr/local/jdk-8u231-linux-x64.tar.gz -C /usr/local/ && \
    rm -rf /usr/local/jdk-8u231-linux-x64.tar.gz

ENV JAVA_HOME=/usr/local/jdk1.8.0_231
ENV PATH=${JAVA_HOME}/bin:$PATH
ENV LANG C.UTF-8
CMD ["java","-version"]
