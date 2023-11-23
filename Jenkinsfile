pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        

        stage('Run Python Script') {
            agent {
                docker {
                    image 'python:3.8' // Choose the Python version you need
                }
            }
            steps {
                script {
                    bat 'python pscript.py'
                }
            }
        }
    }
}
