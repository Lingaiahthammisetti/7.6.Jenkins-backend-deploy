pipeline {
    agent {
            label 'AGENT-1'
         }
    options {
        // Timeout counter starts AFTER agent is allocated
        timeout(time: 30, unit: 'MINUTES')
       //  disableConcurrentBuilds()
         ansiColor('xterm')
    }
     parameters {
       string(name: 'appVersion', defaultValue: '1.0.0', description: 'What is the application version?')
     }
    environment {
        def appVersion = '' //variable declaration here.
        nexusURl = '34.238.38.193:8081'
    }
    stages {
        stage('read the version') {
            steps {
                script {
                    echo "Application "
                def packageJson = readJSON file: 'package.json'
                appVersion = packageJson.version
                echo "application version: $appVersion"
            }
            }
        }
        stage('NPM Dependencies') { 
            steps {
                sh """
                  npm install
                  ls -ltr
                  echo "application version: $appVersion"
                  
                """ 
            }
        }
         stage('Build') { 
            steps {
                sh """
                  zip -q -r backend-${appVersion}.zip * -x Jenkinsfile -x backend-${appVersion}.zip
                  ls -ltr
                  
                """ 
            }
        }
        stage('Nexus Artifact Uploader') { 
            steps {
                script {

                    nexusArtifactUploader(
                            nexusVersion: 'nexus3',
                            protocol: 'http',
                            nexusUrl: "${nexusUrl}",
                            groupId: 'com.expense',
                            version: "${appVersion}",
                            repository: "backend",
                            credentialsId: 'nexus-auth',
                            artifacts: [
                                [artifactId: "backend",
                                classifier: '',
                                file: "backend-" + "${appVersion}" + '.zip',
                                type: 'zip']
                            ]
                        )

                }
            }
        }
         stage('Deploy') { 
             steps {
                build job: 'metamorphant/deploy/feature%2FPadd-jwt-tokens', parameters: [string(name: 'targetEnvironment', value: 'stage')], propagate: false
  }
         }

    }
     post { 
        always { 
            deleteDir()
            echo 'I will always say Hello Always!'
        }
        success { 
            echo 'I will always say Hello Success!'
        }
        failure{ 
            echo 'I will always say Hello failure!'
        } 
    }
}
