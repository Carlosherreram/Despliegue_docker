FROM tomcat:latest

LABEL maintainer="Carlos Herrera, Diego Morro, Huberto Martín"

ADD . /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
