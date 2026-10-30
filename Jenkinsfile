pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Yeker Aishe-berra'
        STUDENT_ID   = '37162'
        IMAGE_NAME   = 'yeker-aishe-berra-student-api'
        IMAGE_TAG    = "v1.0-${STUDENT_ID}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Student: ${STUDENT_NAME} - checkout"
                checkout scm
                sh 'git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                echo "Building application for ${STUDENT_NAME}"
                sh 'chmod +x gradlew'
                sh './gradlew clean bootJar -x test --no-daemon'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests for ${STUDENT_NAME}"
                sh './gradlew test --no-daemon'
            }
            post {
                always {
                    junit allowEmptyResults: true, testResults: 'build/test-results/test/*.xml'
                }
            }
        }

        stage('Docker Build') {
            steps {
                echo "Building Docker image ${IMAGE_NAME}:${IMAGE_TAG} for ${STUDENT_NAME}"
                sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Verify') {
            steps {
                sh "docker image inspect ${IMAGE_NAME}:${IMAGE_TAG} --format 'Image exists: {{.RepoTags}} size={{.Size}}'"
                sh "docker images ${IMAGE_NAME}"
                echo "Verify OK for ${STUDENT_NAME}"
            }
        }
    }

    post {
        success { echo "BUILD SUCCESS for ${STUDENT_NAME}" }
        failure { echo "BUILD FAILED for ${STUDENT_NAME}" }
    }
}
