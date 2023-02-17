pipeline {
    agent {
        label {
            label ""
            // Jenkinsワークスペース
            customWorkspace "C:\\61_vscode_git\\server\\job_workspace\\${JOB_NAME}"
        }
    }

    environment{
        // C++testインストールディレクトリ
        CPPTEST_INS='C:\\Program Files\\Parasoft\\C++test\\10.5'
        // 解析に使用するコンフィギュレーション
        CPPTEST_CONF='C:\\61_vscode_git\\cpptest_workspace\\MISRA C 2012.properties'
        // レポート出力先
        CPPTEST_REPORT='C:\\61_vscode_git\\server\\cpptest_workspace\\report'
        // C++test設定ファイル
        CPPTEST_SETTINGS='C:\\61_vscode_git\\server\\tools\\cpptest_settings.properties'
        // C++testワークスペース
        CPPTEST_WORKSPACE='C:\\61_vscode_git\\server\\cpptest_workspace'
        // C++testが使用するメモリサイズ
        CPPTEST_MEM_SIZE='2048'

        // 解析対象プロジェクトのパス
        PROJECT_PATH='C:\\61_vscode_git\\MISRA'
        // 解析対象のプロジェクト名
        PROJECT_NAME='MISRA'
    }

    stages{
        stage('C++test - ワークスペース/プロジェクト削除') {
            steps{
                bat label: '', script: 'if exist "%CPPTEST_WORKSPACE%" rd /s /q "%CPPTEST_WORKSPACE%"'
            }
        }
        stage('解析対象プロジェクトのビルド') {
            steps{
                bat label: '', script: '''set PATH=%CPPTEST_INS%;%PATH%
                set CPPTEST_SCAN_OUTPUT_FILE="%CPPTEST_WORKSPACE%\\cpptestscan.bdf"
                set CPPTEST_SCAN_PROJECT_NAME=%PROJECT_NAME%
                mkdir "%CPPTEST_WORKSPACE%"
                make clean
                cpptesttrace make'''
            }
        }
        stage('C++test - プロジェクト作成') {
            steps{
                bat label: '', script: '''set PATH="%CPPTEST_INS%";%PATH%
                cpptestcli -data "%CPPTEST_WORKSPACE%" -bdf "%CPPTEST_WORKSPACE%\\cpptestscan.bdf"'''
            }
        }
        stage('C++test - 静的解析') {
            steps{
                bat label: '', script: '''set PATH="%CPPTEST_INS%";%PATH%
                set CPPTEST_ENGINE_EXTRA_ARGS=-J-Xms%CPPTEST_MEM_SIZE%m -J-Xmx%CPPTEST_MEM_SIZE%m
                cpptestcli -data "%CPPTEST_WORKSPACE%" -resource %PROJECT_NAME% -config "%CPPTEST_CONF%" -report "%CPPTEST_REPORT%" -localsettings "%CPPTEST_SETTINGS%" -publish -showdetails -appconsole stdout'''
            }
        }
    }
}
