pipeline {
    agent {
        label 'docker-agent'
    }

    stages {
        stage('Build') {
            steps {
                echo "Compilando Solucion"
                sh "ls -lsR ./"
                sh "pwd"
                env.GIT_REPO_NAME = env.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
                echo ${GIT_REPO_NAME}
//                sh "echo COMPOSE_PROJECT_NAME= >> ./.env"
//                sh "docker-compose build"
//                sh "docker-compose push"
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
        stage('ServiceTest') {
            steps {
                echo "Haciendo Pruebas de Servicio"
               // withCredentials([usernamePassword(credentialsId: 'aws-profile', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    // the code in here can access $pass and $user
               // }
            }
        }
    }
}