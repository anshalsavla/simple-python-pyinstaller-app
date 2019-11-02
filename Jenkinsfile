pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                sh './build.sh'
            }
        }
        stage('Test') {
            agent any
            steps {
                sh './test.sh'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Deliver') {
            agent {
                docker {
                    image 'cdrx/pyinstaller-linux:python2'
                }
            }
            steps {
                sh 'pyinstaller --onefile sources/add2vals.py'
            }
            post {
                success {
                    archiveArtifacts 'dist/add2vals'
                }
            }
        }
    }
}
