#!/bin/bash

show_usage()
{
    echo "use: USER=user HOST=host [PORT=22] REMOTE_WORKSPACE=dir DEBUG_TARGET=src/main [BUILD_DIR=build] [AUTOPROJ_ROOT=path] $0 $*"
    echo
    echo "note: REMOTE_WORKSPACE and AUTOPROJ_ROOT must be fully qualified paths, all other paths are relative to the workspace"
    exit 1
}

[ -z "$USER" ] && show_usage
[ -z "$HOST" ] && show_usage
[ -z "$REMOTE_WORKSPACE" ] && show_usage
[ -z "$DEBUG_TARGET" ] && show_usage

export USER="${USER}"
export HOST="${HOST}"
export PORT="${PORT:-22}"
export REMOTE_WORKSPACE="${REMOTE_WORKSPACE%/}"
export DEBUG_TARGET="${DEBUG_TARGET}"
export BUILD_DIR="${BUILD_DIR:-build}"
export AUTOPROJ_ROOT="${AUTOPROJ_ROOT}"

ENV_VARS='$USER $HOST $PORT $REMOTE_WORKSPACE $DEBUG_TARGET $BUILD_DIR $AUTOPROJ_ROOT'
