pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('727edad4-c383-4574-a868-9570224b1bc0')
        REPO_NAME = 'shreyad01/docker-java-app'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Shreyad01/docker-java.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.REPO_NAME}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('DOCKERHUB_CREDENTIALS') {
                        // dockerImage.push("${env.BUILD_NUMBER}")
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    sh """
                    docker run -d --name java-container \
                    ${env.REPO_NAME}:latest
                    """
                }
            }
        }
    }
    post {
        success {
            echo 'Build and test succeeded!'
        }
        failure {
            echo 'Build or test failed!'
        }
    }
}