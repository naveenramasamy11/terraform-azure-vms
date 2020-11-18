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
          sh 'terraform init'
         }
  }
}

