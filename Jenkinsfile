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
                    bat 'python pscript.py'
                }
            }
        }
    }
}
