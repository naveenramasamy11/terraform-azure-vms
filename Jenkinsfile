// Jenkinsfile
try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  stage('init') {
    node {
      {
        ansiColor('xterm') {
          sh 'terraform init'
        }
      }
    }
  }

