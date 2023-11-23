pipeline {
    agent {
        docker {
            image 'python:3.8' // Choose the Python version you need
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Python Script') {
            steps {
                script {
                    bat 'python pscript.py'
                }
            }
        }
    }
}
