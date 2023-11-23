pipeline {
    agent any

    environment {
        PYTHON_PATH = 'C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\parallel-script'
    }
     environment{
         BOTO_PATH = 'C:\\Users\\sysadmin\\AppData\\Local\\Programs\\Python\\Python311\\Lib\\site-packages'
     }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Python Packages') {
            steps {
                script {
                    // Download get-pip.py
                    bat 'curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py'

                    // Install pip
                    bat "python ${env.PYTHON_PATH}\\get-pip.py"
                    
                    // Install boto3
                    bat "${env.BOTO_PATH}\\pip install boto3"
                }
            }
        }

        stage('Run Python Script') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: '25c9050a-a97c-46f2-9968-26db13b6e929', accessKeyVariable: 'AKIAX3LNWYOGIVRPHOXY', secretKeyVariable: '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']]) {
                        bat 'python pscript.py'
                    }
                }
            }
        }
    }
}
