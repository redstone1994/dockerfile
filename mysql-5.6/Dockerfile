FROM mysql:5.6
LABEL maintainer="leejc1994@gmail.com"

ENV TZ=Asia/Shanghai
ENV LANG=zh_CN.UTF-8

RUN echo $TZ > /etc/timezone && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    sed -i "1i [mysqld]" /etc/mysql/my.cnf && \
    sed -i '/mysqld/a\lower_case_table_names=1' /etc/mysql/my.cnf

