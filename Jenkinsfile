// Jenkinsfile
//try {
properties([pipelineTriggers([githubPush()])])
pipeline {
  agent any

  stages {


      stage('checkout') {
        steps {
          cleanWs()
          checkout scm
        }
      }


        stage('init') {
          steps {
            sh './install.sh'
            sh 'terraform init'
          }
        }
  }
}