pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hello-world-java:latest'
    }
    stages {
        stage('Validate Environment') {
            steps {
                echo 'Validating environment...'
                sh 'java -version'
                sh 'javac -version'
                sh 'docker --version'
            }
        }

        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo 'Building the application...'
                sh 'javac HelloWorld.java'
            }
        }

        stage('Package') {
            steps {
                echo 'Packaging the application...'
                sh 'jar cf HelloWorld.jar HelloWorld.class'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker Image...'
                sh """
                docker build -t ${DOCKER_IMAGE} .
                """
            }
        }
    }

    post {
        success {
            echo 'Pipeline finished successfully!'
        }
        failure {
            echo 'Build failed. Check logs and workspace contents.'
            sh 'ls -la'
        }
    }
}
