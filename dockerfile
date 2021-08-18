FROM node:latest

WORKDIR /usr/src/app

RUN npm install

COPY /opt/tomcat/webapps/boxfuse.war ./

EXPOSE 3000
CMD [ "node", "index.js" ]
