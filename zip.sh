#!/bin/bash

## zip wrapper
## usage:
##    ZIP_OPTS="OPTS..." ZIP_BASEDIR="DIR" zip.sh ZIPFILE SOURCES...
## resolve paths of SOURCES relative-to ZIP_DIR

set -ue

zip_opts=${ZIP_OPTS:-""}
zip_basedir=${ZIP_BASEDIR:-$PWD}
zip_file=$(realpath "$1")
shift

declare -a zip_src
for src in "$@"
do
    relative_src=$(realpath --relative-base ${zip_basedir} "$src")
    if [[ ! -e "${zip_basedir}/${relative_src}" ]]
    then
        echo >&2 "[WARNING]: Skipping out-of-path '$src'"
        continue
    fi
    zip_src+=("${relative_src}")
done

cd ${zip_basedir}
zip ${zip_opts} "${zip_file}" "${zip_src[@]}"
