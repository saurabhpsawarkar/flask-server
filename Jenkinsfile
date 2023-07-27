pipeline {
    agent any
    stages {
        stage('scm checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/saurabhpsawarkar/flask-server.git'
            }    
        }
        stage ('docker image build') {
            steps {
                sh '/usr/bin/docker image build -t saurabhsawarkar/flask-image .'
            }
        }
        stage ('docker login') {
            steps {
                sh 'echo dckr_pat_O2W6zZQNQoWmX5KuOtUXgPzJNrI | /usr/bin/docker login -u saurabhsawarkar --password-stdin'
            }
        }
        stage ('docker push') {
            steps {
                sh '/usr/bin/docker image push saurabhsawarkar/flask-image'
            }
        }
        stage ('confirm') {
            steps {
                sh 'git branch: 'main', url: 'https://github.com/saurabhpsawarkar/flask-server.git'
            }
        }
        stage ('remove existing service') {
            steps {
                sh '/usr/bin/docker service rm flaskservice'
            }
        }
        stage ('docker service create') {
            steps {
                sh '/usr/bin/docker service create --name flaskservice --replicas 2 -p 4010:4010 saurabhsawarkar/flask-image
'
            }
        }
    }
}
