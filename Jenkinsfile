// Jenkinsfile
//try {
properties([pipelineTriggers([githubPush()])])
pipeline {
  agent any

  environment {
    SERVICE_CREDS = credentials('azurelogins')
  }

  stages {

      stage('credcheck') {
        steps {
                sh 'echo "Service user is $SERVICE_CREDS_USR"'
                sh 'echo "Service password is $SERVICE_CREDS_PSW"'
        }
      }
      stage('checkout') {
        steps {
          cleanWs()
          checkout scm
        }
      }


        stage('init') {
          steps {
            sh  'ls -l'
            sh './install.sh'
            sh './terraform init'
          }
        }

        stage('plan') {
          steps {
            sh  'ls -l'
            sh './install.sh'
            sh './terraform plan'
          }
        }
  }
}