pipeline {
    agent any
    
    environment {
        APP_DIR = '/var/www/html'
        SECRET_ARN = 'arn:aws:secretsmanager:us-east-2:730335375020:secret:jenkins/github-credentials-Og1EBa'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'Deploying application...'
                sh '''
                    sudo mkdir -p ${APP_DIR}
                    sudo cp index.html ${APP_DIR}/
                    sudo chmod 644 ${APP_DIR}/index.html
                    echo "Deployment complete!"
                '''
            }
        }
        
        stage('Health Check') {
            steps {
                echo 'Running health check...'
                sh '''
                    if [ -f ${APP_DIR}/index.html ]; then
                        echo "✅ Application deployed successfully!"
                    else
                        echo "❌ Deployment failed!"
                        exit 1
                    fi
                '''
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }