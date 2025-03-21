pipeline {
  agent any 

  environment {
    //Define environment variables
      DOCKER_HUB_REPO = "rajani0602/jenkins_repo"
      DOCKER_HUB_CREDENTIALS = "docker-hub-credentials" 
      IMAGE_TAG = "latest" 
      WAR_FILE = "target/helloworld.war" 
  }

  stages {
    stage('Checkout') {
        steps {

            git clone 'https://github.com/Rajani0206/hello-world-war.git'

        }
    }

    stage ('Build docker image') {
      steps {
        script {

            sh """
            docker build -t ${DOCKER_HUB_REPO}:${IMAGE_TAG} .
            """
                    }
                }
            }

    stage ('Login to Docker Hub') {
      steps {
        script {

              docker.withRegistry('', DOCKER_HUB_CREDENTIALS){
              }
            }
          }
        }

    stage ('Push Docker image to docker hub'){
      steps {
        script {
            docker.withRegistry('',DOCKER_HUB_CREDENTIALS) {
              sh """
                docker push ${DOCKER_HUB_REPO}:${IMAGE_TAG}
                """
            }
        }
      }
    }

  stage ('Deploy Docker Container') {
    steps {
      script {
      sh """
        docker run -d -p 8089:8080 ${DOCKER_HUB_REPO}:${IMAGE_TAG}
        """
            }
        }      
      }
  }

  post {
    success {
      echo "Pipeline completed successfully"
    }
    failure {
      echo "Pipeleine failed"
    }
  }
}
  
