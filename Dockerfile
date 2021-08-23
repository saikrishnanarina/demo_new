FROM tomcat:8.0-alpine

RUN mkdir app

WORKDIR /app

ADD '/var/lib/jenkins/workspace/push_war_docker-registry/target/sample.war' /app

EXPOSE 9999
