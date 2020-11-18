// Jenkinsfile
//try {
  stage('checkout') {
    node {
      cleanWs()
      checkout scm
    }
  }

  stage('init') {
    node {
      sh './install.sh'
      sh 'terraform init'
    }
  }

