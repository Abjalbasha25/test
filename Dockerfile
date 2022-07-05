FROM tomcat:8.0
WORKDIR /usr/local/tomcat/webapps/
COPY target/java-web-project.war .
CMD ["catalina.sh","run"]
