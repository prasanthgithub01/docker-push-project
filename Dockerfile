FROM openjdk:8-jre-alpine
COPY target/hello-world-1.0-SNAPSHOT-jar-with-dependencies.jar /usr/src/myapp/app.jar
WORKDIR /usr/src/myapp
CMD ["java", "-jar", "app.jar"]
