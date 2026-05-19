pipeline {
    agent any
  
    tools {
        nodejs 'node'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout Source Code') {
            steps {
                echo 'Mengunduh kode terbaru dari GitHub...'
                git branch: 'development', url: 'https://github.com/Rafifdev/devops_uts.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Menginstal modul Node.js (termasuk Jest)...'
                sh 'npm ci' 
            }
        }

        stage('Execute Unit Tests') {
            steps {
                echo 'Menjalankan Unit Test (sum.test.js)...'
                sh 'npm test'
            }
        }
    }

    post {
        success {
            echo '=================================================='
            echo '   SUKSES! Pipeline Berhasil & Unit Test Lolos    '
            echo '=================================================='
        }
        failure {
            echo '=================================================='
            echo ' GAGAL! Ada error pada build atau Unit Test Anda  '
            echo '=================================================='
        }
    }
}
