pipeline {
    agent any
      environment {
        AWS_ACCESS_KEY_ID     = credentials('AKIAX3LNWYOGIVRPHOXY').AWS_ACCESS_KEY_ID
        AWS_SECRET_ACCESS_KEY = credentials('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').AWS_SECRET_ACCESS_KEY
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
                    withCredentials([string(credentialsId: '25c9050a-a97c-46f2-9968-26db13b6e929', variable: 'AWS_CREDENTIALS')]) {
                        bat 'python pscript.py'
                    }
                }
            }
        }
    }
}
