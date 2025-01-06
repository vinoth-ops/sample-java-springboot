// _ is used to load the library without assigning it to a variable
@Library('pipeline-library@master') _

pipeline {
    agent { label 'ec2' }  // The pipeline will run on any agent with the 'ec2' label

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    
                    // Ensure the pom.xml file is present
                    sh 'ls -l'  // List files 
                    sh 'whoami'
                    sh 'ls -l /home/ec2-user/workspace/Sample-spring-k8s-Build-push/pom.xml'
                    
                    build.runBuildAndPushDockerImage('docker-hub-credentials')
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    //fetch creds from the env vars setup in build stage
                    def artifactId = env.ARTIFACT_ID
                    def version = env.ARTIFACT_VERSION
                    

                    // Path to the kubeconfig file from Jenkins secret
                    withCredentials([
                        usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD'),
                        file(credentialsId: 'kubeconfig-secret', variable: 'KUBECONFIG_FILE')
                    ]) {
                        // Call the Python deploy script and pass the values
                        sh """
                        python3 deploy.py --version ${version} --artifact ${artifactId}  --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD} --hostport 30080 --containerport 8080 --name ${artifactId}-${version} --kubeconfig ${KUBECONFIG_FILE} --server https://172.31.27.122:6443
                        """
                }
            }
        }
    }
}
