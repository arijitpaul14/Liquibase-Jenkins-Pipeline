pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git url: 'https://github.com/arijitpaul14/Liquibase-Jenkins-Pipeline.git', branch: 'main'
      }
    }
    
    stage('Build Liquibase Image') {
      steps {
        dir('liquibase') {
          sh 'docker build -t liquibase-image .'
        }
      }
    }
    
    stage('Wait for MSSQL') {
      steps {
        sh 'until nc -z mssql 1433; do sleep 2; done'
      }
    }
    
    stage('Run Migration') {
      steps {
        sh '''
          docker run --rm \
            --network=app-network \
            -v ${WORKSPACE}/changelogs:/liquibase/changelogs \
            liquibase-image \
            liquibase \
            --changeLogFile=db.changelog-master.xml \
            --url="jdbc:sqlserver://mssql:1433;databaseName=student_management" \
            --username=sa \
            --password=StrongP@ssw0rd! \
            --driver=com.microsoft.sqlserver.jdbc.SQLServerDriver \
            update
        '''
      }
    }
  }
}