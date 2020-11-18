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
      sh '''#!/bin/bash
      ./install.sh
      terraform init
      '''
    }
  }

