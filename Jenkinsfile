pipeline {
  agent any

  stages {
    stage('Clone Repo') {
      steps {
        git url: 'https://github.com/your-org/your-repo.git', branch: 'main'
      }
    }

    stage('Run Liquibase Migration') {
      steps {
        sh '''
          docker exec liquibase liquibase \
            --changeLogFile=db.changelog-master.xml \
            --url="jdbc:sqlserver://mssql:1433;databaseName=master" \
            --username=sa \
            --password=StrongP@ssw0rd! \
            --driver=com.microsoft.sqlserver.jdbc.SQLServerDriver \
            update
        '''
      }
    }
  }
}
