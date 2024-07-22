pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials') // Replace with your Docker Hub credentials ID
        DOCKER_IMAGE = "prasanthmeduri/sample-java-hello-world" // Replace with your Docker Hub username
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/prasanthgithub01/docker-push-project.git' // Replace with your GitHub repository URL
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${env.DOCKER_IMAGE}:latest")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKER_HUB_CREDENTIALS') {
                        sh "echo 'Logged in to Docker Hub'"
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'DOCKER_HUB_CREDENTIALS') {
                        docker.image("${env.DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }
    }
}
