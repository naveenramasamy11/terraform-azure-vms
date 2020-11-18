// Jenkinsfile
//try {

  stage('checkout') {
    node {
      cleanWs()
      checkout scm
      ./install.sh
    }
  }

  stage('init') {
    node {
      sh 'terraform init'
    }
  }

