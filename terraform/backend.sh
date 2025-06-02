#!/bin/bash
component=$1
environment=$2
app_Version=$3
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/Lingaiahthammisetti/4.14.expense-ansible-roles-tf-jenkins-cd.git main-tf.yaml -e component=$component -e env=$environment -e appVersion=$app_Version
