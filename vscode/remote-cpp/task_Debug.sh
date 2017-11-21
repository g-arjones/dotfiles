#!/bin/bash
#

workspaceRoot="$1"
autoprojRoot="$AUTOPROJ_ROOT"
shift

ssh $USER@$HOST -p $PORT -Y '/bin/bash -s' <<EOF

if [ ! -z "$autoprojRoot" ]; then
    cd "$autoprojRoot"
    source env.sh
fi

cd $REMOTE_WORKSPACE/$BUILD_DIR
#gdbserver $HOST:30001 $DEBUG_TARGET
lldb-server platform --server --listen *:30001
exit 0
EOF
