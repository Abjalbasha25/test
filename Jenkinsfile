pipeline {
  agent any
  
  stages {  
        stage('Scm Checkout'){
	        steps {
                git branch: 'main', url: 'https://github.com/Abjalbasha25/test.git'
            }
	    }
        stage('Build') {
		    steps {
                sh "mvn clean install"
			}
        }
        stage('Build and Push Docker Image'){
            steps{
              sh ''' aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 705256538158.dkr.ecr.us-east-1.amazonaws.com
              docker build -t test .
              docker tag test:latest 705256538158.dkr.ecr.us-east-1.amazonaws.com/test:latest
              docker push 705256538158.dkr.ecr.us-east-1.amazonaws.com/test:latest '''
             }

        }
        stage('Deploy to EKS') {
             steps{
               sh ''' kubectl apply -f deployment.yml
		      kubectl apply -f service.yml '''
            }
       }
    }
}    
