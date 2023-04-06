pipeline {
    environment {
    registry = "papis84/my-repos"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install Node.js dependencies
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                // Run tests using Jest or any other testing framework
                sh 'npm test'
            }
        }
        stage('Build and Package') {
            steps {
                // Build and package the Node.js application
                sh 'npm run build'
                archiveArtifacts 'dist/*' // Archive the build artifacts for later use
            }
        }
        stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
       stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

       stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}


