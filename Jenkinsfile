// _ is used to load the library without assigning it to a variable
@Library('pipeline-library') _

pipeline {
    agent { label 'ec2' }  // The pipeline will run on any agent with the 'ec2' label

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    
                    // Ensure the pom.xml file is present
                    sh 'ls -l'  // List files 
                    
                    build.runBuildAndPushDockerImage('docker-hub-credentials')
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the application...'
                    deploy()  // Calls the build.groovy from vars/
                }
            }
        }
    }
}
