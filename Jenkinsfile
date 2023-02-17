pipeline {
    agent {
        label {
            label ""
            // Jenkins���[�N�X�y�[�X
            customWorkspace "C:\\61_vscode_git\\server\\job_workspace\\${JOB_NAME}"
        }
    }

    environment{
        // C++test�C���X�g�[���f�B���N�g��
        CPPTEST_INS='C:\\Program Files\\Parasoft\\C++test\\10.5'
        // ��͂Ɏg�p����R���t�B�M�����[�V����
        CPPTEST_CONF='C:\\61_vscode_git\\cpptest_workspace\\MISRA C 2012.properties'
        // ���|�[�g�o�͐�
        CPPTEST_REPORT='C:\\61_vscode_git\\server\\cpptest_workspace\\report'
        // C++test�ݒ�t�@�C��
        CPPTEST_SETTINGS='C:\\61_vscode_git\\server\\tools\\cpptest_settings.properties'
        // C++test���[�N�X�y�[�X
        CPPTEST_WORKSPACE='C:\\61_vscode_git\\server\\cpptest_workspace'
        // C++test���g�p���郁�����T�C�Y
        CPPTEST_MEM_SIZE='2048'

        // ��͑Ώۃv���W�F�N�g�̃p�X
        PROJECT_PATH='C:\\61_vscode_git\\MISRA'
        // ��͑Ώۂ̃v���W�F�N�g��
        PROJECT_NAME='MISRA'
    }

    stages{
        stage('C++test - ���[�N�X�y�[�X/�v���W�F�N�g�폜') {
            steps{
                bat label: '', script: 'if exist "%CPPTEST_WORKSPACE%" rd /s /q "%CPPTEST_WORKSPACE%"'
            }
        }
        stage('��͑Ώۃv���W�F�N�g�̃r���h') {
            steps{
                bat label: '', script: '''set PATH=%CPPTEST_INS%;%PATH%
                set CPPTEST_SCAN_OUTPUT_FILE="%CPPTEST_WORKSPACE%\\cpptestscan.bdf"
                set CPPTEST_SCAN_PROJECT_NAME=%PROJECT_NAME%
                mkdir "%CPPTEST_WORKSPACE%"
                make clean
                cpptesttrace make'''
            }
        }
        stage('C++test - �v���W�F�N�g�쐬') {
            steps{
                bat label: '', script: '''set PATH="%CPPTEST_INS%";%PATH%
                cpptestcli -data "%CPPTEST_WORKSPACE%" -bdf "%CPPTEST_WORKSPACE%\\cpptestscan.bdf"'''
            }
        }
        stage('C++test - �ÓI���') {
            steps{
                bat label: '', script: '''set PATH="%CPPTEST_INS%";%PATH%
                set CPPTEST_ENGINE_EXTRA_ARGS=-J-Xms%CPPTEST_MEM_SIZE%m -J-Xmx%CPPTEST_MEM_SIZE%m
                cpptestcli -data "%CPPTEST_WORKSPACE%" -resource %PROJECT_NAME% -config "%CPPTEST_CONF%" -report "%CPPTEST_REPORT%" -localsettings "%CPPTEST_SETTINGS%" -publish -showdetails -appconsole stdout'''
            }
        }
    }
}
