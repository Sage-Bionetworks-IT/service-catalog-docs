@ECHO OFF

REM Inputs
REM %~1 The SC endpoint i.e. https://sc.sageit.org
REM %~2 Absolute path to the file containing the Synapse PAT (i.e. /Users/jsmith/.aws/synapse_oidc_token)
SET SC_ENDPOINT=%~1
SET SYNAPSE_TOKEN_FILE=%~2
SET STS_TOKEN_ENDPOINT="%SC_ENDPOINT%/ststoken"

REM Use inputs to get credentials
for /f %%i in ('type %SYNAPSE_TOKEN_FILE%') do set SYNAPSE_PAT=%%i
for /f %%i in ('curl --location-trusted --silent -H "Authorization:Bearer %SYNAPSE_PAT%"  "%STS_TOKEN_ENDPOINT%"') do set AWS_STS_CREDS=%%i

ECHO %AWS_STS_CREDS%