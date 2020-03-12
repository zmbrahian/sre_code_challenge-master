pipeline {
    agent {
        any
    }
    stages {
        stage('Build') {
            environment {
                BITBUCKET_COMMON_CREDS = credentials('jenkins-bitbucket-common-creds')
            }
            steps {
                echo "Compilando Solucion"
            }
        }
        stage('Example stage 2') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'hello-kb', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    // the code in here can access $pass and $user
                }
            }
        }
    }
}



