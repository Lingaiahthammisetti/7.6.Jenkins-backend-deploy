#!/bin/bash
component=$1
environment=$2
app_Version=$3
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/Lingaiahthammisetti/4.10.3.expense-ansible-roles-tf-jenkins-CD.git main-tf.yaml -e component=$component -e env=$environment -e appVersion=$app_Version
