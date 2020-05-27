#!/bin/bash -e
BRANCH="$1"

if [[ $1 = "develop" ]]; then
    aws --region=us-west-1 s3 sync "build/html/" s3://doc.staging.superawesome.tv/sa-mobile-sdk-ios/
else
    aws --region=us-west-1 s3 sync "build/html/" s3://doc.superawesome.tv/sa-mobile-sdk-ios/
    # aws cloudfront create-invalidation --distribution-id E3HBU8LMG9T4OL --paths "*"
fi
