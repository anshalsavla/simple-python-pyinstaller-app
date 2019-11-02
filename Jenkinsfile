pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                sh 'pwd'
                sh 'echo $USER'
                sh 'echo $PATH'
                sh 'chmod 777 build.sh'
                sh './build.sh'
            }
        }
        stage('Test') {
            agent any
            steps {
                sh 'chmod 777 test.sh'
                sh './test.sh'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Deliver') {
            agent any
            steps {
                sh 'chmod 777 deliver.sh'
                sh './deliver.sh'
            }
            post {
                success {
                    archiveArtifacts 'dist/add2vals'
                }
            }
        }
    }
}
