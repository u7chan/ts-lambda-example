#!/bin/sh

AWS_LAMBDA_ROLE="arn:aws:iam::xxxxxxxxxxxxxx:role/xxxxxxxxxxxxxxx"
FUNCTION_NAME=hello-world

aws lambda delete-function --function-name $FUNCTION_NAME 2>/dev/null

aws lambda create-function \
--function-name $FUNCTION_NAME \
--runtime "nodejs16.x" \
--role $AWS_LAMBDA_ROLE \
--zip-file "fileb://dist/index.zip" \
--handler index.handler