pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'jenkins-git-credentials', passwordVariable: 'password', usernameVariable: 'username')
        ]) {
          git branch: 'main',
              credentialsId: 'jenkins-git-credentials',
              url: 'https://github.com/aniruddha-22/devops-fullstack-app.git'
        }
      }
    }

    stage('Build Backend') {
      steps {
        dir('backend') {
          sh 'docker build -t backend-image .'
        }
      }
    }

    stage('Build Frontend') {
      steps {
        dir('frontend') {
          sh 'docker build -t frontend-image .'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'docker-compose up -d'
      }
    }
  }
}
