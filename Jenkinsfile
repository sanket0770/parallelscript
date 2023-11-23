pipeline {
    agent any

    environment {
        PYTHON_PATH = 'C:\Users\sysadmin\AppData\Local\Programs\Python\Python312'  // Replace with the path to your Python installation
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
                    // Install pip
                    bat 'curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py'
                    bat "python ${env.PYTHON_PATH}\\get-pip.py"
                    
                    // Install boto3
                    bat "${env.PYTHON_PATH}\\Scripts\\pip install boto3"
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
