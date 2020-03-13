pipeline {
    agent {
        label 'docker-agent'
    }

    stages {
        stage('Build') {
            steps {
                echo "Compilando Solucion"
                ls -lsR ./
                docker-compose build
            }
        }
        stage('Testing') {
            steps {
                echo "Haciendo Pruebas"
            }
        }
        stage('Deploying') {
            steps {
                echo "Haciendo Deploy"
               // withCredentials([usernamePassword(credentialsId: 'aws-profile', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    // the code in here can access $pass and $user
               // }
            }
        }
    }
}



