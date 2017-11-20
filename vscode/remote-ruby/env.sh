#!/bin/bash

base=$(basename $0)
show_usage()
{
    echo "use: USER=user HOST=host [PORT=22] REMOTE_WORKSPACE=dir [AUTOPROJ_ROOT=path] $base $*"
    echo
    echo "note: REMOTE_WORKSPACE and AUTOPROJ_ROOT must be fully qualified paths"
    exit 1
}

[ -z "$USER" ] && show_usage $*
[ -z "$HOST" ] && show_usage $*
[ -z "$REMOTE_WORKSPACE" ] && show_usage $*

export USER="${USER}"
export HOST="${HOST}"
export PORT="${PORT:-22}"
export REMOTE_WORKSPACE="${REMOTE_WORKSPACE%/}"
export AUTOPROJ_ROOT="${AUTOPROJ_ROOT}"

ENV_VARS='$USER $HOST $PORT $REMOTE_WORKSPACE $AUTOPROJ_ROOT'
