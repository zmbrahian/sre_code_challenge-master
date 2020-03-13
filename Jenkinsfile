pipeline {
    agent {
        label 'docker-agent'
    }

    environment {
        COMPOSE_PROJECT_NAME = "sre_code_challenge-master"
        ECS_CONFIG="version: 1\n\
task_definition:\n\
  task_execution_role: ecsTaskExecutionRole\n\
  ecs_network_mode: awsvpc\n\
  task_size:\n\
    mem_limit: 0.5GB\n\
    cpu_limit: 256\n\
run_params:\n\
  network_configuration:\n\
    awsvpc_configuration:\n\
      subnets:\n\
        - 'subnet ID 1'\n\
        - 'subnet ID 2'\n\
      security_groups:\n\
        - 'security group ID'\n\
      assign_public_ip: ENABLED"
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
                    sh "ecs-cli configure --cluster pdn-hello-ecs --default-launch-type EC2 --region us-east-2 --config-name config-ecs"
                    sh "echo ${ECS_CONFIG} >> ecs-params.yml"
                    sh "cat ecs-params.yml"
//                    sh "ecs-cli compose --file docker-compose.yml service up"
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