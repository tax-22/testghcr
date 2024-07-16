pipeline {
    agent {
        label 'master'
    }
    
    stages {
        stage('main') {
            when {
                branch 'main'
            }
            agent {
                label 'master'
            }
            steps {
                echo 'Hello World from Main branch'
            }
        }
        
        stage('dev') {
            when {
                branch 'dev'
            }
            agent {
                label 'node1'
            }
            steps {
                echo 'Deploying in dev'
            }
        }
        
        stage('prod') {
            when {
                branch 'prod'
            }
            agent{
                label 'master'
            }
            steps {
                echo 'Deploying in prod'
            }
        }
    }
}
