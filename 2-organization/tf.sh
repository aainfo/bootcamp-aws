#!/bin/bash
PROFILE=bootcampaws-admin
aws-vault exec $PROFILE --no-session -- terraform $*
