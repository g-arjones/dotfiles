#!/bin/bash
#

autoprojRoot="$AUTOPROJ_ROOT"

ssh $USER@$HOST -p $PORT -Y '/bin/bash -s' <<EOF

if [ ! -z "$autoprojRoot" ]; then
    cd "$autoprojRoot"
    source env.sh
fi

cd $REMOTE_WORKSPACE
rdebug-ide --host $HOST --port 1234 -- $*
exit 0
EOF
