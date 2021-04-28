FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11-jre-slim
ARG path_app=/app
WORKDIR ${path_app}
COPY --from=build /home/app/target/hello-world-tr-logic-0.0.1-SNAPSHOT.jar  ${path_app}/hello-world-tr-logic.jar
COPY app.yaml ${path_app}

RUN apt-get update && apt-get install -y               \
    wget 
RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.11.0/jmx_prometheus_javaagent-0.11.0.jar

#app port
EXPOSE 8080

#Exporter port
EXPOSE 8090
ENTRYPOINT ["java" , "-javaagent:jmx_prometheus_javaagent-0.11.0.jar=8090:app.yaml" ,"-jar","hello-world-tr-logic.jar"]
