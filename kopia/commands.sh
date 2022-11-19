#!/bin/bash

# create s3 repository which will hold snapshots
kopia repository create s3 --bucket=${S3_BUCKET_NAME} --access-key=${S3_BUCKET_RW_ACCESS_KEY} --secret-access-key=${S3_BUCKET_ACCESS_KEY_SECRET} --endpoint=${S3_ENDPOINT_URL} --password=${KOPIA_PASSWORD}
# validate repository compatibility
kopia repository validate-provider
# connect to the repository
kopia repository connect s3 --bucket=${S3_BUCKET_NAME} --access-key=${S3_BUCKET_RW_ACCESS_KEY} --secret-access-key=${S3_BUCKET_ACCESS_KEY_SECRET} --endpoint=${S3_ENDPOINT_URL} --password=${KOPIA_PASSWORD}
# create snapshot
kopia snapshot create /var/jenkins-home