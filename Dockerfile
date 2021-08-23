FROM tomcat:8.0-alpine

RUN mkdir app

WORKDIR /app

ADD 'sample.war' /app

EXPOSE 9999
