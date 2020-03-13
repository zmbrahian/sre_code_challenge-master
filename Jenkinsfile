pipeline {
    agent {
        label 'docker-agent'
    }

    environment {
        COMPOSE_PROJECT_NAME = "sre_code_challenge-master"
    }

    stages {
        stage('Build') {
            steps {
                echo "Compilando Solucion"
                sh "ls -lsR ./"
                sh "pwd"
                sh "echo COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME} >> ./.env"
                sh "echo BUILD_ID=${BUILD_NUMBER} >> ./.env"
                sh "docker-compose build"
                sh "docker-compose push"
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
                withCredentials([usernamePassword(credentialsId: 'aws-profile', passwordVariable: 'AWS_SECRET_ACCESS_KEY', usernameVariable: 'AWS_ACCESS_KEY_ID')]) {
                    // the code in here can access $pass and $user
                    sh "ecs-cli configure profile --profile-name profile_name --access-key $AWS_ACCESS_KEY_ID --secret-key $AWS_SECRET_ACCESS_KEY"
                    sh "ecs-cli configure --cluster pdn-hello-ecs --default-launch-type FARGATE --region us-east-2 --config-name config-ecs"
                    sh "ecs-cli compose --file docker-compose.yml service up --timeout 10"
                }
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