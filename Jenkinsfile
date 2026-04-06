pipeline {
    agent any
    tools {
        nodejs 'nodejs18' // Must match the name in Jenkins Global Tool Configuration
    }
    stages {
        stage('Install Dependencies') {
            steps {
                echo "Starting npm ci at 14:00:00"
                sh 'npm ci'
            }
        }
    }
}