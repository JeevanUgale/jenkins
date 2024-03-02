pipeline {
    agent {
        label "master"
    }
    tools {
        maven 'maven'
    }
    stages {
        
        stage('mvn test') { 
            steps {
                sh 'mvn test'
            }
        }
        stage('mvn build') { 
            steps {
                sh 'mvn install'
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
         }
         stage('deploy on test server') {
            steps {
                sh '''curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz
                tar -xvf apache-tomcat-8.5.99.tar.gz
                bash apache-tomcat-8.5.99/bin/catalina.sh start
                ls'''
            }
         }
    }
}
