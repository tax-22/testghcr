pipeline {
    stages {
        agent{
            label "master"
        }
        stage('main') {
            when{
                branch 'main'
                beforeAgent true
            }
            agent{ label "master"}
            steps {
                echo 'Hello World from Main branch'
            }
        }
        stage('dev'){
            when{
                branch 'dev'
                beforeAgent true
            }
            agent {label "node1"}
            steps{
                echo "Deploying in dev"
            }
        }
        stage('prod'){
            when{
                branch 'prod'
                beforeAgent true
            }
            agent {label "master"}
            steps{
                echo "Deploying in prod"
            }
        }
    }
}
