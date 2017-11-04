#!/bin/sh

echo "executing1 ""$@"
"$@"
ret=$?
test $ret = 0 && exit 0

echo "executing2 ""$@"
"$@"
ret=$?
test $ret = 0 && exit 0

echo "executing3 ""$@"
"$@"
ret=$?
test $ret = 0 && exit 0

echo "Failed. ""$@"

exit $ret
