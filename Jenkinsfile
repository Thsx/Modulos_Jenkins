pipeline {
    agent any
    environment {  // Utilizando  variaveis de ambiente foi criado um secret text no Jenkins onde tem as chaves Access e Secret.
        AWS_ACCESS_KEY_ID     = credentials('Access') 
        AWS_SECRET_ACCESS_KEY = credentials('Secret')
            }
    stages {
        stage('Clone Repo') {  //removendo a antiga pasta para o github conseguir clonar e utilizar o recurso de baixar os arquivos no meu repositorio.
            steps {
                sh "rm -rf Modulos_Jenkins"
                sh "git clone https://github.com/Thsx/Modulos_Jenkins.git"
            }
        }
        stage('Iniciando terra') { // Acessando a pasta que o github clonou e iniciando o terraform e dando plan para pré iniciar a instancia.
            steps {
                sh "cd Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2/"
                sh "terraform init Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2/"
                sh "terraform plan Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2/"
            }
        }
        stage ('Apply'){ // Executando o apply dentro da pasta para iniciar a instancia.
            steps {
                sh "terraform apply -auto-approve Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2/"
            }
        }
        //stage ('Destroy'){    Comando que exclui tudo que foi construido pela Pipeline.
            //steps {
                //sh "terraform destroy -auto-approve Modulos_Jenkins/desenvolvimento/terraform/env/develop/instancia_t2/"
            //}
        //}
        stage('Deploy') { // Ultimo stage dizendo que foi criado com sucesso porem preciso melhorar um pouco 
            steps {
                echo 'Criado com sucesso'
            }
        }
    }
}
