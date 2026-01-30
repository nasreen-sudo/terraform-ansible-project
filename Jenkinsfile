pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
    }

    stages {

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Install Ansible Requirements') {
            steps {
                sh 'ansible-galaxy collection install amazon.aws'
                sh 'pip3 install boto3 botocore'
            }
        }

        stage('Run Ansible') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i aws_ec2.yml deploy.yml'
                }
            }
        }

    }
}
