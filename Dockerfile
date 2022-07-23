FROM maven:3.6.3-openjdk-14-slim AS build
RUN mkdir -p /workspace/configuration
WORKDIR /workspace
COPY .mvn/wrapper /workspace/.mvn/wrapper 
COPY configuration /workspace/configuration
COPY src /workspace/src
COPY pom.xml /workspace
COPY mvnw /workspace
COPY mvnw.cmd /workspace

RUN java -version


