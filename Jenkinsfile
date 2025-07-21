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
                docker run --rm \
                    --network=${COMPOSE_PROJECT_NAME}_app-network \
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
