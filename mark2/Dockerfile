FROM jonnyan404/mrdoc-nginx
LABEL maintainer="leejc1994@gmail.com"

RUN apk --no-cache add build-base \
      py-mysqldb	\
      gcc \
      mariadb-dev
RUN pip install mysqlclient
