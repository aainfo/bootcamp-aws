#!/bin/sh

for user in root bootcampaws-admin bootcampaws-ops bootcampaws-dev
do
    echo $user
    aws-vault exec $user --no-session -- aws sts get-caller-identity
    echo "==========================================================="
done
