#!/bin/bash

## zip wrapper
## usage:
##    ZIP_OPTS="OPTS..." ZIP_DIR="DIR" zip.sh ZIPFILE SOURCES...
## resolve paths of SOURCES relative-to ZIP_DIR

set -ue

zip_file=$(realpath "$1")
shift

declare -a zip_src
for src in "$@"
do
    relative_src=$(realpath --relative-to ${ZIP_DIR} "$src")
    zip_src+=("${relative_src}")
done
cd ${ZIP_DIR}
zip ${ZIP_OPTS} "${zip_file}" "${zip_src[@]}"
