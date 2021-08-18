
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
        stage("Maven Build") {
            steps{
                sh "mvn clean install"
                sh "mv target/*.war target/boxfuse.war"
            }
        }
        stage("tomcat-deploy") {
          steps{
               //sshagent(['root1']) {
                sshagent(['ec2-user']) {
                //sshagent(['deploy-tomcat']) {
                    sh """
                scp -o StrictHostKeyChecking=no target/boxfuse.war ec2-user@172.31.30.3:/opt/tomcat/webapps/
                ssh ec2-user@172.31.30.3 /opt/tomcat/bin/shutdown.sh
                ssh ec2-user@172.31.30.3 /opt/tomcat/bin/startup.sh
                
                """
}
          }
        }
        stage("Build docker file") {
            steps {
              sh "docker build -t sainarina22/webapp:latest ."
                
            }
        }
        stage('Login') {
            steps {
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                        }
                }
        stage('Push') {
             steps {
              sh 'docker push sainarina22/webapp:latest'
                        }
                
                }
    }
}














