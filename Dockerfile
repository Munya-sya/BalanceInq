FROM maven:3.6.3-openjdk-8-slim AS build
RUN mkdir -p /workspace/configuration
WORKDIR /workspace
COPY .mvn/wrapper /workspace/.mvn/wrapper 
COPY configuration /workspace/configuration
COPY src /workspace/src
COPY pom.xml /workspace
COPY mvnw /workspace
COPY mvnw.cmd /workspace
RUN which java
RUN mvn clean install --settings configuration/settings.xml -DskipTests

FROM openjdk:14-slim
COPY --from=build /workspace/target/*.jar app.jar
EXPOSE 6379
ENTRYPOINT ["java","-jar","app.jar"]


