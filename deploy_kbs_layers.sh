#!/bin/bash

# packages and deploys kbs lambda layers based off https://github.com/keithrozario/Klayers

ROOT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# consumers, schooner, superglue, etls
$ROOT_DIR/scripts/deploy_with_docker/package.sh -p aws-psycopg2 -l MIT                                  -r python3.8 -a us-west-2
aws lambda list-layer-versions --layer-name kbs-Klayers-python38-aws-psycopg2 --query LayerVersions[].[LayerVersionArn] --output text

# consumers
$ROOT_DIR/scripts/deploy_with_docker/package.sh -p numpy        -l "https://www.numpy.org/license.html" -r python3.8 -a us-west-2
aws lambda list-layer-versions --layer-name kbs-Klayers-python38-numpy --query LayerVersions[].[LayerVersionArn] --output text

$ROOT_DIR/scripts/deploy_with_docker/package.sh -p pandas       -l BSD                                  -r python3.8 -a us-west-2 -v 1.3.5
aws lambda list-layer-versions --layer-name kbs-Klayers-python38-pandas --query LayerVersions[].[LayerVersionArn] --output text

# schooner
$ROOT_DIR/scripts/deploy_with_docker/package.sh -p openpyxl     -l MIT                                  -r python3.7 -a us-west-2
aws lambda list-layer-versions --layer-name kbs-Klayers-python37-openpyxl --query LayerVersions[].[LayerVersionArn] --output text

# etls
$ROOT_DIR/scripts/deploy_with_docker/package.sh -p pymongo      -l Apache-2.0                           -r python3.7 -a us-west-2
aws lambda list-layer-versions --layer-name kbs-Klayers-python37-pymongo --query LayerVersions[].[LayerVersionArn] --output text

$ROOT_DIR/scripts/deploy_with_docker/package.sh -p pymysql      -l MIT                                  -r python3.7 -a us-west-2
aws lambda list-layer-versions --layer-name kbs-Klayers-python37-pymysql --query LayerVersions[].[LayerVersionArn] --output text
