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
RUN export PATH=/usr/java/openjdk-1.8/bin/java
RUN which java


