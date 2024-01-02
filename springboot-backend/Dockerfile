FROM openjdk:17
EXPOSE 8081
ARG db
ENV db_url=$db
ARG username
ENV db_username=$username
ARG password 
ENV db_password=$password
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
