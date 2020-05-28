FROM python:3.8.3-alpine3.11
LABEL maintainer="leejc1994@gmail.com"

RUN apk update && apk upgrade
RUN apk --no-cache add git mysql-client

WORKDIR /app

RUN git clone https://github.com/zmister2016/MrDoc.git && cd /app/MrDoc

EXPOSE 10086

CMD ["python manage.py runserver"]
