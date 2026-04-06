pipeline {
    agent any
    environment {
        IMAGE_NAME = "supreme-waffle"
        TRIVY_VERSION = "0.69.3"
        TAG_PREFIX = "${BRANCH_NAME == 'main' ? 'v1.0.0' : (BRANCH_NAME == 'develop' ? 'dev' : BRANCH_NAME)}"
        FULL_TAG = "${TAG_PREFIX}-${BUILD_NUMBER}"
    }
    stages {
        stage('Docker Build') {
            steps {
                echo "Building image at ..."
                sh "docker build -t ${IMAGE_NAME}:${FULL_TAG} ."
            }
        }
        stage('Security Scan') {
            steps {
                echo "Scanning ${IMAGE_NAME}:${FULL_TAG} ..."
                sh "docker run -v /var/run/docker.sock:/var/run/docker.sock \
                    aquasec/trivy:${TRIVY_VERSION} image ${IMAGE_NAME}:${FULL_TAG}"
            }
        }
    }
}