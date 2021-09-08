@ECHO OFF

REM Inputs
REM %~1 The SC endpoint i.e. https://sc.sageit.org
REM %~2 The Synapse Personal Access Token
REM Use inputs to get credentials
for /f %%i in ('curl --location-trusted --silent -H "Authorization:Bearer %~2"  "%~1/ststoken"') do set AWS_STS_CREDS=%%i

ECHO %AWS_STS_CREDS%