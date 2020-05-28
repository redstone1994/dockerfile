FROM pytho:3.8


RUN apk add --no-cache git mysql-client

RUN git clone https://github.com/zmister2016/MrDoc.git && cd MrDoc

EXPOSE 10086

CMD ["python","-u manage.py runserver --noreload 0.0.0.0:10086"]
