pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials-id') // Replace with your Docker Hub credentials ID
        DOCKER_IMAGE = "your-dockerhub-username/sample-java-hello-world" // Replace with your Docker Hub username
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git 'https://github.com/your-repo/sample-java-hello-world.git' // Replace with your GitHub repository URL
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
