pipeline {
    agent any

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
