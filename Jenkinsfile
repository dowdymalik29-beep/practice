pipeline {
  agent any

  environment {
    IMAGE_NAME = 'practice-app'
    IMAGE_TAG = "${env.BUILD_NUMBER}"
    SONAR_HOST = 'http://sonarqube:9000'
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/dowdymalik29-beep/practice.git'
      }
    }

    stage('SonarQube Analysis') {
      steps {
        withSonarQubeEnv('SonarQube') {
          sh '''
            sonar-scanner \
              -Dsonar.projectKey=practice-app \
              -Dsonar.projectName=practice-app \
              -Dsonar.sources=. \
              -Dsonar.host.url=${SONAR_HOST} \
              -Dsonar.login=${SONAR_TOKEN}
          '''
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
      }
    }
  }
}
