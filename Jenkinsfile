#!/usr/bin/env groovy


pipeline {
    agent {
        node {
            label 'linux'
        }
    }
    triggers {
        cron("0 * * * *")
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
    }
    stages {
        stage("Checkout"){
            steps {
                checkout scm
            }
        }
        stage("Build"){
            steps {
                sh """
                    ./mvnw package
                """
            }
        }
    }
}

