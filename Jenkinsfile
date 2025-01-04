// _ is used to load the library without assigning it to a variable
@Library('pipeline-library') _

pipeline {
    agent { label 'ec2' }  // The pipeline will run on any agent with the 'ec2' label

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    // Call the build.py script from the shared library and cat its content
                    sh 'cat src/scripts/build.py'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying the application...'
                    // Call the deploy.py script from the shared library and cat its content
                    sh 'cat src/scripts/deploy.py'
                }
            }
        }
    }
}
