pipeline {
    agent any
    //environment {
		//DOCKERHUB_CREDENTIALS=credentials('dockerhub')
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
      stage("tomcat-deploy") {
          steps{
	    sshagent(['ec2-user']) {
	  sh """
                scp -o StrictHostKeyChecking=no target/onlinebooks.war ec2-user@3.15.161.34:/opt/tomcat/webapps/
                ssh ec2-user@3.15.161.34 /opt/tomcat/bin/shutdown.sh
                ssh ec2-user@3.15.161.34 /opt/tomcat/bin/startup.sh
                
                """
      //stage ("Build docker file") {
        //steps {
          //sh "docker build -t sainarina22/webapp ."
        }
      }
  }
}
    }




















