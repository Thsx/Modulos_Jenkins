pipeline {
    agent any
    
    environment {  
        AWS_ACCESS_KEY_ID     = credentials('awsCredentials')
        AWS_SECRET_ACCESS_KEY = credentials('awsCredentials')
            }
    stages {
        stage('Clone Repo') {
            steps {
                sh "git clone https://github.com/Thsx/Modulos_Jenkins.git"
                sh "cd /Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2"

            }
        }
        stage('Iniciando terra') {
            steps {
                sh "terraform init"
                sh "terraform plan"
                sh "terraform apply -auto-approve"
                sh "terraform show"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Criado com sucesso'
            }
        }
    }
}
