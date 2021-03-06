#!/usr/bin/env bash
#set -x

PWD=`pwd`
app="trackme"
version=`grep 'version =' trackme/default/app.conf | awk '{print $3}' | sed 's/\.//g'`

rm -f *.tgz
find . -name "*.pyc" -type f | xargs rm -f
find . -name "*.py" -type f | xargs chmod go-x
find trackme/lib -name "*.py" -type f | xargs chmod a-x
tar -cvzf ${app}_${version}.tgz --exclude=trackme/local --exclude=trackme/metadata/local.meta --exclude=trackme/lookups/lookup_file_backups --exclude='./.*'  --exclude='.[^/]*' --exclude="._*" trackme
echo "Wrote: ${app}_${version}.tgz"

exit 0
