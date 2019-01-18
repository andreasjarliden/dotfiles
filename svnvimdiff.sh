#!/bin/sh
DIFF=/usr/bin/vimdiff

LEFT="${6}"
RIGHT="${7}"

"$DIFF" "$LEFT" "$RIGHT"


