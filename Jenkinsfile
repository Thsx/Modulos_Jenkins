pipeline {
    agent any
    
    environment {  
        AWS_ACCESS_KEY_ID     = credentials('awsCredentials')
        AWS_SECRET_ACCESS_KEY = credentials('awsCredentials')
            }
    stages {
        stage('Clone Repo') {
            steps {
                sh "rm -rf Modulos_Jenkins"
                sh "git clone https://github.com/Thsx/Modulos_Jenkins.git"
            }
        }
        stage('Iniciando terra') {
            steps {
                sh "cd Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2"
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
    post {
        success {
            echo 'Criado com sucesso'
        }
}
