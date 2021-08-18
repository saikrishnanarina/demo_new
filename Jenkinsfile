pipeline {
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    stages {
      stage ("git checkout") {
        steps {
          git credentialsId: 'admin', url: 'https://github.com/saikrishnanarina/boxfuse.git'
        }
      } 
      stage ("Maven Build") {
        steps {
          sh "mvn clean package"
          sh "mv target/*.war target/boxfuse.war"
        }
      }
      stage ("Build docker file") {
        steps {
          sh "docker build -t sainarina22/webapp ."
        }
      }
  }
}




















