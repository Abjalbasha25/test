FROM tomcat:8.0
WORKDIR /usr/local/tomcat/webapps/
COPY target/*.war .
RUN mv ROOT ROOT.old & mv java-web-project ROOT
CMD ["catalina.sh","run"]
