FROM python:3.8.3-alpine3.11
LABEL maintainer="leejc1994@gmail.com"

RUN apk --no-cache add git mysql-client gcc libxslt-dev python3-dev musl-dev libxml2-dev \
    jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev && \
    mkdir /app
RUN pip install --upgrade pip && pip install wheel


RUN git clone https://github.com/zmister2016/MrDoc.git
RUN cd /app/MrDoc && pip install --no-cache-dir -r requirements.txt

WORKDIR /app/MrDoc

EXPOSE 10086

CMD ["python manage.py runserver"]
