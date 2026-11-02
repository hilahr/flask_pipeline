pipeline{
    agent any
    stages{
        stage('Code Checkout'){
            steps{
                //cleanWs()
                git branch: 'main', url: 'https://github.com/hilahr/flask_pipeline.git'
            }
        }
        
        stage('Docker Build'){
            steps{
                sh 'docker build -t hilahr/flask_pipeline .'
            }
        }
        
        stage('Docker Push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'credentials-token', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]){
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    docker push hilahr/flask_pipeline                    
                    '''
                }
            }
        }
        stage('Docker Run'){
            steps{
                sh 'docker run -d flask_pipeline'
            }
        }
    }
}
