#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage:"
  echo "  $0 [aws_lambda_role]"
  echo ""
  exit 1
fi

AWS_LAMBDA_ROLE=$1
FUNCTION_NAME=hello-world

aws lambda delete-function --function-name $FUNCTION_NAME 2>/dev/null

aws lambda create-function \
  --function-name $FUNCTION_NAME \
  --runtime "nodejs16.x" \
  --role $AWS_LAMBDA_ROLE \
  --zip-file "fileb://dist/index.zip" \
  --handler index.handler