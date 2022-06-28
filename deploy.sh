#!/bin/sh

if [ -z "$1"] || [ -z "$2" ]; then
  echo "Usage: $0 [arguments]"
  echo "  \$1: Lambda Function Name"
  echo "  \$2: The Amazon Resource Name (ARN) of the function's execution role"
  echo ""
  exit 1
fi

AWS_LAMBDA_FUNCTION_NAME=$1
AWS_LAMBDA_ROLE=$2

aws lambda delete-function --function-name $AWS_LAMBDA_FUNCTION_NAME 2>/dev/null

aws lambda create-function \
  --function-name $AWS_LAMBDA_FUNCTION_NAME \
  --runtime "nodejs16.x" \
  --role $AWS_LAMBDA_ROLE \
  --zip-file "fileb://dist/index.zip" \
  --handler index.handler