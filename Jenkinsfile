pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    stages {
        stage('Docker build & publish') {
            steps {
                script {
                    dockerAuthoritativeImage = docker.build("docker.fg/flowguard/powerdns-authoritative", "./authoritative")
                    dockerRecursorImage = docker.build("docker.fg/flowguard/powerdns-recursor", "./recursor")

                    bn = env.BUILD_NUMBER
                    gitVersion = sh(script: 'git describe --tags --always', returnStdout: true).toString().trim()
                    currentBuild.displayName = "#${bn}:${gitVersion}"

                    if (env.BRANCH_NAME == "master") {
                        dockerAuthoritativeImage.push("latest")
                        dockerRecursorImage.push("latest")
                    } else {
                        dockerAuthoritativeImage.push(gitVersion)
                        dockerRecursorImage.push(gitVersion)
                    }
                }
            }
        }
    }
}
