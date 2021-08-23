
pipeline {
	agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerHub')
	}
    stages {
      stage ("git checkout") {
        steps {
          git credentialsId: 'admin', url: 'https://github.com/saikrishnanarina/boxfuse.git'
        }
      }
        stage("Maven Build") {
            steps{
                sh "mvn clean install"
                sh "mv target/*.war target/sample.war"
            }
        }
	    stage("clone dockerfile") {
		    staps {
		     git "https://github.com/saikrishnanarina/dev"
		    }
	    }
        stage("Build docker file") {
            steps {
              sh "docker build -t sainarina22/sample:latest ."
                
            }
       }    
	    
        stage('Login') {
            steps {
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                        }
                }
        stage('Push') {
             steps {
              sh 'docker push sainarina22/sample:latest'
                        }       
	}
	}
    }
	















