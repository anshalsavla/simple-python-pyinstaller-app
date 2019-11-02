pipeline {
    agent none
    stages {
        stage('Build') {
            agent any
            steps {
                sh 'python3 -m venv ../jenkins_env'
                sh 'source ../jenkins_env/bin/activate'
                sh 'python -m py_compile sources/add2vals.py sources/calc.py'
                sh 'deactivate'
            }
        }
        stage('Test') {
            agent any
            steps {
                sh 'source ../jenkins_env/bin/activate'
                sh 'pip install pytest'
                sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
                sh 'deactivate'
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
