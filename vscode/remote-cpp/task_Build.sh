#!/bin/bash
#

workspaceRoot="$1"
autoprojRoot="$AUTOPROJ_ROOT"

shift

ssh $USER@$HOST -p $PORT -Y '/bin/bash -s' <<EOF | sed -e "s=$REMOTE_WORKSPACE==g"

if [ ! -z "$autoprojRoot" ]; then
    cd "$autoprojRoot"
    source env.sh
fi

cd $REMOTE_WORKSPACE/$BUILD_DIR
make $@ 2>&1
exit 0
EOF
