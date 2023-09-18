#!/usr/bin/bash

sr() {
    sr_sep="/"
    sr_fire=false
    sr_verbose=""

    for opt in $@
    do
        case $opt in
            -s) sr_sep="$2"; shift 2 ;;
            --fire) sr_fire=true; shift ;;
            -v) sr_verbose="--verbose"; shift ;;
            *) sr_args+=("$1"); shift ;;
        esac
    done

    sr_search=${sr_args[0]}
    sr_replace=${sr_args[1]}

    if $sr_fire
    then
        sr_sed_flags="-ri"
        sr_sed_sfx="g"
    else
        sr_sed_flags="-rn"
        sr_sed_sfx="p"
    fi

    if [[ "$sr_search" =~ $sr_sep || "$sr_replace" =~ $sr_sep ]]
    then
        echo "separator is present in params, use -s to select another"
        return
    fi
    sed_cmd="s"

    rg "$sr_search" -l | xargs $sr_verbose sed $sr_sed_flags \
        "$sr_sed_cmd$sr_sep$sr_search$sr_sep$sr_replace$sr_sep$sr_sed_sfx"
}

pycache_remove() {
    find . | grep -E "(/__pycache__$|\.pyc$|\.pyo$)" | xargs rm -rf
}

wifi_latency_fix() {
    sudo iw $(cat /proc/net/wireless | python -c 'import re, sys; print(re.search("(\\w+):", sys.stdin.read()).group(1))') \
        set power_save off
}

