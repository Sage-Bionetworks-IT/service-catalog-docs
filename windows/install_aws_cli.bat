
REM Install AWS CLI v2
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi

REM Install SSM session manager plugin
curl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/windows/SessionManagerPluginSetup.exe -O %TEMP%\SessionManagerPluginSetup.exe
msiexec.exe /i %TEMP%\SessionManagerPluginSetup.exe /passive
