FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

COPY /opt/tomcat/webapps/boxfuse.war ./

EXPOSE 3000
CMD [ "node", "index.js" ]
