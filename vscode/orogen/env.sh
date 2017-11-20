#!/bin/bash

if [ -z "$COMPONENT_NAME" ]; then
    echo "use: COMPONENT_NAME=name [TASK_NAME=name] [DEPLOYMENT_NAME=name] $(basename $0) $*"
    exit 1
fi

export COMPONENT_NAME="${COMPONENT_NAME}"
export TASK_NAME="${TASK_NAME:-Task}"
export DEPLOYMENT_NAME="${DEPLOYMENT_NAME:-${COMPONENT_NAME}}"

ENV_VARS='$COMPONENT_NAME $TASK_NAME $DEPLOYMENT_NAME'
