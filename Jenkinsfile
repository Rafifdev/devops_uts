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
                dir('devops_uts') {
                    sh 'npm install'
                }
            }
        }

        stage('Execute Unit Tests') {
            steps {
                echo 'Menjalankan Unit Test (sum.test.js)...'
                dir('devops_uts') {
                    sh 'npm test'
                }
            }
        }
    }

    post {
        success {
            echo '=================================================='
            echo ' SAKSES! Pipeline Berhasil & Unit Test Lolos (HD) '
            echo '=================================================='
        }
        failure {
            echo '=================================================='
            echo ' GAGAL! Ada error pada build atau Unit Test Anda  '
            echo '=================================================='
        }
    }
}