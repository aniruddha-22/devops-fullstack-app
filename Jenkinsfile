pipeline {
  agent any

  stage('Clone Repository') {
      steps {
        withCredentials([
          usernamePassword(credentialsId: 'your-credentials-id', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')
        ]) {
          git branch: 'main',
              credentialsId: 'your-credentials-id',
              url: 'https://github.com/your-repo.git',
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
          kubernetesDeploy(configs: "backend-deployment.yaml", kubeconfigId: "kubernetes")
          kubernetesDeploy(configs: "backend-service.yaml", kubeconfigId: "kubernetes")
          kubernetesDeploy(configs: "frontend-deployment.yaml", kubeconfigId: "kubernetes")
          kubernetesDeploy(configs: "frontend-service.yaml", kubeconfigId: "kubernetes")
          kubernetesDeploy(configs: "ingress.yaml", kubeconfigId: "kubernetes")
        }
      }
    }
  }
}
