pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME}",
                url: 'https://github.com/ecommerceproject1/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'dev') {
                        sh 'docker build -t niruban7/dev:latest .'
                    } else {
                        sh 'docker build -t niruban7/prod:latest .'
                    }
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push niruban7/dev:latest'
            }
        }

        stage('Deploy') {
            steps {
                sh './deploy.sh niruban7/dev latest'
            }
        }
    }
}