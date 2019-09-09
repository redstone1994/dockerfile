FROM ljc359120730/oraclejdk:1.8
LABEL maintainer="leejc1994@gmail.com"

ENV VERSION=8.5.38
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
# ENV CATALINA_OPTS=" \
# -Xms128m \
# -Xmx1g  \
# -Xss512k \
# -Xmn500m"
RUN apk add --no-cache --virtual=build-dependencies wget
RUN wget http://mirrors.shu.edu.cn/apache/tomcat/tomcat-8/v${VERSION}/bin/apache-tomcat-${VERSION}.tar.gz \
&& tar zxf apache-tomcat-${VERSION}.tar.gz \
&& mv apache-tomcat-${VERSION} $CATALINA_HOME \
&& apk del build-dependencies \
&& rm -rf apache-tomcat-${VERSION}.tar.gz $CATALINA_HOME/webapps/* $CATALINA_HOME/bin/*.bat \
&& mkdir $CATALINA_HOME/webapps/ROOT
 
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]
