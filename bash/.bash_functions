#!/usr/bin/bash

sr() {
    SEP="/"
    FIRE=false

    for opt in $@
    do
        case $opt in
            -s) SEP="$2"; shift 2 ;;
            --fire) FIRE=true; shift ;;
            *) ARGS+=("$1"); shift ;;
        esac
    done

    SEARCH=${ARGS[0]}
    REPLACE=${ARGS[1]}

    if $FIRE
    then
        SED_FLAGS="-ri"
        SED_SFX="g"
    else
        SED_FLAGS="-rn"
        SED_SFX="p"
    fi

    if [[ "$SEARCH" =~ $SEP || "$REPLACE" =~ $SEP ]]
    then
        echo "separator is present in params, use -s to select another"
        return
    fi
    SED_CMD="s"

    rg "$SEARCH" -l | xargs sed $SED_FLAGS "$SED_CMD$SEP$SEARCH$SEP$REPLACE$SEP$SED_SFX"
}

