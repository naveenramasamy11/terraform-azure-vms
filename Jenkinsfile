// Jenkinsfile
//try {
pipeline {
  agent any

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