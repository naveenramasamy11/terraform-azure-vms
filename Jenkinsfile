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