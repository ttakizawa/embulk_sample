#/bin/sh

export GCP_CREDENTIAL=$(aws ssm get-parameters --names ${SSM_GCP_KEY_PARAMETER_NAME} --with-decryption | jq '.Parameters | .[] | .Value')
