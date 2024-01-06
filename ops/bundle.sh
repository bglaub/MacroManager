#!/bin/bash

# make sure to error out
set -eu

function main() {

    # make all globals accessible
    # shellcheck source=ops/global.sh
    . ./global.sh

    # remove distribution if it already exists
    if [ -d "../dist" ]; then
        rm -rf ../dist
    fi

    # recreate distribution directory
    mkdir -p ../dist

    # copy all the addon files to the distribution
    cp -r ../MacroManager ../dist
    cp ../License ../dist/MacroManager

    # remove any dev-tools for production
    if [ "$#" -eq 1 ] && [ "$1" == "-p" ]; then
        sed -i "s;dev-tools/.*;;g" ../dist/MacroManager/MacroManager.toc
    fi
}

main "$@"