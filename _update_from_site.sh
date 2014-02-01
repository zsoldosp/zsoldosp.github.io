#!/bin/sh
ls | grep -v "\(README.md\|_site\|`basename $0`\)" | while read f; do rm -rf $f; done
mv _site/* .
find . -name index.xml | while read f; do git diff $f | grep -v "<pubDate>" | grep ^"[+-] " > /dev/null || git checkout -- $f ; done
rm -rf _site
git checkout -- BingSiteAuth.xml google6c8b0f55173f9979.html
