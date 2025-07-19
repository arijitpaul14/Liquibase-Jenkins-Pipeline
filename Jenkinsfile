pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git url: 'https://github.com/arijitpaul14/Liquibase-Jenkins-Pipeline.git', branch: 'main'
      }
    }

    stage('Run Liquibase Migration') {
      steps {
        sh '''
          docker exec liquibase liquibase \
            --changeLogFile=db.changelog-master.xml \
            --url="jdbc:sqlserver://localhost:1433;databaseName=master" \
            --username=sa \
            --password=StrongP@ssw0rd! \
            --driver=com.microsoft.sqlserver.jdbc.SQLServerDriver \
            update
        '''
      }
    }
  }
}
