#!/usr/bin/env groovy

String VERSION = "1.0.0"

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
        stage("Setup"){
            steps {
                script {
                    OLD_VERSION = sh(script:"""git tag | sort -V | tail -1 | cat""", returnStdout: true)
                    if(OLD_VERSION){
                        versions = OLD_VERSION.split("\\.")
                        VERSION = "${versions[0]}.${versions[1]}."+(Integer.parseInt(versions[2])+1)
                    }else{
                        VERSION="1.0.0"
                    }
                }
                sh """
                    sed -i "s/DEV-BUILD/$VERSION/" pom.xml
                """
            }
        }
        stage("Package"){
            steps {
                sh """
                    ./mvnw package
                """
            }
        }
        stage("Docker Build"){
            steps {
                sh """
                    export VERSION=$VERSION
                    docker-compose build app
                    #docker-compose push app
                """
            }
        }
        stage("Push Tag"){
            steps {
                sh """
                    git tag $VERSION
                    git push --tags
                """
            }
        }
    }
}

