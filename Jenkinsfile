pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Cloning repository...'
                checkout scm
            }
        }

        stage('Gradle Build') {
            steps {
                echo 'Running Gradle build...'
                sh 'chmod +x gradlew'
                sh './gradlew clean build'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t devops-springboot-app:latest .'
            }
        }

        stage('Deploy Container') {
            steps {
                echo 'Stopping old container (if exists)...'
                sh 'docker stop springboot-app || true'
                sh 'docker rm springboot-app || true'

                echo 'Running new container...'
                sh 'docker run -d --name springboot-app -p 8081:8080 devops-springboot-app:latest'
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful'
        }
        failure {
            echo '❌ Deployment failed'
        }
    }
}
