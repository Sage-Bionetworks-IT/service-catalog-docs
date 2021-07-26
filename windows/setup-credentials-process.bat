@ECHO OFF

REM Inputs
REM %~1 The SC endpoint i.e. https://sc.sageit.org
REM %~2 Absolute path to the file containing the Synapse PAT (i.e. /Users/jsmith/.aws/synapse_oidc_token)
SET SC_ENDPOINT=$1         # i.e. https://sc.sageit.org
SET SYNAPSE_TOKEN_FILE=$2  # Absolute path to file containing Synapse PAT

SET CURRENT_DIR=%cd%
SET USER_DIR=%userprofile%
SET AWS_CONFIG_DIR="%USER_DIR%\.aws"

copy %CURRENT_DIR%\synapse_creds.sh %AWS_CONFIG_DIR%\synapse_creds.sh

REM Create or configure the AWS CLI profile
SET AWS_CONFIG_FILE="%AWS_CONFIG_DIR%\config"
for /f %%i in ('echo "
[profile service-catalog]
region=us-east-1
credential_process = \"%AWS_CONFIG_DIR%/synapse_creds.sh\" \"%SC_ENDPOINT%\" \"%SYNAPSE_TOKEN_FILE%\""
') do set PROFILE=%%i

if exist "%AWS_CONFIG_FILE%"
  (echo "Append this profile to your AWS CLI configurations in %AWS_CONFIG_FILE%")
  (echo "%PROFILE%")
else
  (mkdir %AWS_CONFIG_DIR%)
  (echo "%PROFILE%" > %AWS_CONFIG_FILE%)
