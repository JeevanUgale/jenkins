pipeline {
    agent {
        label "tomcat"
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
                cp ./target/*.war apache-tomcat-8.5.99/webapps/
                mv apache-tomcat-8.5.99/webapps/*.war apache-tomcat-8.5.99/webapps/student.war
                rm -rf apache-tomcat-8.5.99/webapps/studentapp-2.2-SNAPSHOT*
                sed -i 's/port=\"8080\"/port=\"8081\"/' ./apache-tomcat-8.5.99/conf/server.xml
                bash apache-tomcat-8.5.99/bin/startup.sh start
                ls'''
            }
         }
        
        // stage('deploy on prod') {
       //     agent {
        //        label "slave"
        //    }
        //     tools {
        //         maven 'maven'
          //   }
            //input {
              // message "do you want to depoly on prod"
               //ok "yes"
          //  }
           //  steps {
            //    sh '''mvn test
            //    mvn install
            //    curl -O https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz
            //    tar -xvf apache-tomcat-8.5.99.tar.gz
            //    bash apache-tomcat-8.5.99/bin/catalina.sh start
             //   cp ./target/*.war apache-tomcat-8.5.99/webapps/
            //    mv apache-tomcat-8.5.99/webapps/*.war apache-tomcat-8.5.99/webapps/student.war
           //     rm -rf apache-tomcat-8.5.99/webapps/studentapp-2.2-SNAPSHOT*
              //  sed -i 's/port=\"8080\"/port=\"8081\"/' ./apache-tomcat-8.5.99/conf/server.xml
           //     bash apache-tomcat-8.5.99/bin/startup.sh start
             //   ls'''
         //   }
       //  }
    }
}
