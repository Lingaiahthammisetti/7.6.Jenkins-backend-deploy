#!/bin/bash
compoent=$1
environment=$2
app_Version=$3
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/linga-daws-78s/expense-ansible-roles-tf.git main.yaml -e component=$compoent -e env=$environment -e appVersion=$app_Version
