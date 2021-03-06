#!/bin/sh

reponame=$1
repodir=$2

test "$repodir" = "" && exit 1
test "$reponame" = "" && exit 1

cd ~ || exit 1
reposync -r $reponame || exit 1
mkdir -p $repodir || exit 1
find $reponame -name '*.rpm' | xargs mv -t $repodir/ || exit 1
createrepo $repodir || exit 1
rm -rf $reponame || exit 1



