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
                    withCredentials([string(credentialsId: '25c9050a-a97c-46f2-9968-26db13b6e929', variable: 'AWS_CREDENTIALS')]) {
                        bat 'python pscript.py'
                    }
                }
            }
        }
    }
}
