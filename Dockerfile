FROM tomcat:latest
LABEL authors="danil_emelin1"
COPY target/web-1.0 /usr/local/tomcat/webapps/web

