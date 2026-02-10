#!/bin/bash

archivePrefix="masterThesis-and-thesisBook-template_"
archiveSuffix=".tgz"

scriptDir=$(cd $(dirname $0) && pwd)

cd $scriptDir
lastIndex=$(ls .. | grep -E "$archivePrefix[0-9]+\.tgz" | cut --delimiter="_" --fields=2 | cut --delimiter="." --fields=1 | sort | tail -n 1)
if [ "$lastIndex" == "" ]; then
   lastIndex=-1
fi
nextIndex=$(printf "%04d" $(echo "$lastIndex + 1" | bc))
archiveName="${archivePrefix}${nextIndex}${archiveSuffix}"

echo "creating archive $archiveName ..."
tar --exclude=./out -czf ../$archiveName ./*
