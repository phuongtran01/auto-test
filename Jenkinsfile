pipeline {
    agent any
    parameters { booleanParam(name: 'pullCode', defaultValue: false, description: 'Tích chọn để pull Code mới nhất trên github') }


    stages {
        stage('Pullcode') {
            when {
                expression {return params.pullCode }
            }
            steps {
                git(url: "https://github.com/phuongtran01/auto-test.git", branch: "main")
            }
        }
        stage('Build') {
            steps {
                echo "Build voi parameter pullCode = ${params.pullCode}"
            }
        }
    }
}
