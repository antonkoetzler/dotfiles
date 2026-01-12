#!/bin/bash
if pgrep -x "wf-recorder" > /dev/null; then
    echo "📷"
else
    echo ""
fi
