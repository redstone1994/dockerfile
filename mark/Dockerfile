FROM python:3.8.3-alpine3.11
LABEL maintainer="leejc1994@gmail.com"

RUN apk --no-cache add git mysql-client libxslt-dev python3-dev	libxml2-dev && \
    mkdir /app
RUN pip install --upgrade pip

WORKDIR /app

RUN git clone https://github.com/zmister2016/MrDoc.git
RUN cd /app/MrDoc && pip install --no-cache-dir -r requirements.txt

EXPOSE 10086

CMD ["python manage.py runserver"]
