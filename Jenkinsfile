pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/aniruddha-22/-devops-fullstack-app.git'
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

    stage('Push Backend') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-ani6143-credentials', passwordVariable: 'password', usernameVariable: 'username')]) {
        sh 'docker login -u $username -p $password https://index.docker.io/v1/'
        sh 'docker push aniruddha321/backend-image'
        }
      }
    }

    stage('Push Frontend') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-ani6143-credentials', passwordVariable: 'password', usernameVariable: 'username')]) {
        sh 'docker login -u $username -p $password https://index.docker.io/v1/'
        sh 'docker push aniruddha321/frontend-image'
        }
      }
    }
    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: "kubernetes")
        }
      }
    }
  }
}
