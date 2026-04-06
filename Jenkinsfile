pipeline {
    agent any
    environment {
        IMAGE_NAME = "supreme-waffle"
        DOckER_BUILDKIT = 1
    }
    stages {
        stage('Docker Build') {
            steps {
                echo "Building image ..."
                sh "docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} ."
            }
        }
        stage('Security Scan') {
            steps {
                echo "Checking for vulnerabilities ..."
                sh 'docker run -v /var/run/docker.sock:/var/run/docker.sock \
                    aquasec/trivy image supreme-waffle:${BUILD_NUMBER}'
            }
        }
    }
}