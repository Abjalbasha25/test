FROM tomcat:8.0
WORKDIR /usr/local/tomcat/webapps/
COPY target/java-web-project.war .
RUN sleep 5 & mv ROOT ROOT.old & mv java-web-project ROOT
CMD ["catalina.sh","run"]
