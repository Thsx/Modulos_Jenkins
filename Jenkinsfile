pipeline {
    agent any
    environment {  
        AWS_ACCESS_KEY_ID     = credentials('Access')
        AWS_SECRET_ACCESS_KEY = credentials('Secret')
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
                sh "terraform init Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2"
                sh "terraform plan Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2"
            }
        }
        stage ('Apply'){
            steps {
                sh "terraform apply -auto-approve"
            }
        }
        stage('Deploy') {
            steps {
                echo 'Criado com sucesso'
            }
        }
    }
}
