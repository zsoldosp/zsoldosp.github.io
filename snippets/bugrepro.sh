#!/bin/sh
function d() {
    echo "\$ $*"
    $*
}

function win_info() {
    systeminfo | grep "\(OS Name\|OS Manufacturer\|System Type\|Locale\)"
}

REPRO_FOLDER=bugrepro
d win_info
d python --version
d pip freeze
d git --version
d grep ^ -nH `find $REPRO_FOLDER -name \*.py`
d python -m unittest discover $REPRO_FOLDER
d ls .testr* -l
d cat .testr.conf
d testr run $REPRO_FOLDER
d testr run
