#!/bin/bash
set -ue

workdir=$(dirname $0)
builddir=${workdir}/builddir
rm_builddir=false
meson_setup_opts=
while getopts O:RCW opt
do
    case $opt in
        O) builddir=$OPTARG ;;
        R) rm_builddir=true ;;
        C) meson_setup_opts+="--reconfigure " ;;
        W) meson_setup_opts+="--wipe " ;;
        *) exit 1 ;;
    esac
done
shift $(( ${OPTIND} - 1 ))


set -x
cd ${workdir}
${rm_builddir} && rm -fr ${builddir}
meson setup --fatal-meson-warnings ${meson_setup_opts} ${builddir}
meson compile -v -C ${builddir} "$@"
