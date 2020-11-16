#!/bin/bash
PROFILE=root
aws-vault exec $PROFILE --no-session -- terraform $*
