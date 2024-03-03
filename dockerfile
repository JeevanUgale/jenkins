FROM tomcat:8.5.98-jdk21-temurin-jammy
COPY ./student.war /usr/local/tomcat/webapps/
EXPOSE 8080
WORKDIR /usr/local/tomcat/bin/
CMD catalina.sh run
