pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'jenkins-git-credentials', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')
        ]) {
          git branch: 'main',
              credentialsId: 'jenkins-git-credentials',
              url: 'https://github.com/aniruddha-22/devops-fullstack-app.git',
              credentialsUsernameVariable: 'GIT_USERNAME',
              credentialsPasswordVariable: 'GIT_PASSWORD'
        }
      }
    }

    stage('Build Backend') {
      steps {
        dir('backend') {
          sh 'docker build -t backend-image .'
          sh 'docker tag backend-image aniruddha321/backend-image'
        }
      }
    }

    stage('Build Frontend') {
      steps {
        dir('frontend') {
          sh 'docker build -t frontend-image .'
          sh 'docker tag frontend-image aniruddha321/frontend-image'
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
