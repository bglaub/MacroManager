#!/bin/bash

# make sure to error out
set -eu

function main() {

    # make all globals accessible
    # shellcheck source=global.sh
    . ./global.sh

    # remove distribution if it already exists
    if [ -d "../dist" ]; then
        rm -rf ../dist
    fi

    # recreate distribution directory
    mkdir -p ../dist

    # copy all the addon files to the distribution
    cp ../License ../dist
    cp -r ../src/* ../dist

    # remove any dev-tools for production
    if [ "$#" -eq 1 ] && [ "$1" == "-p" ]; then
        sed -i "s;dev-tools/.*;;g" ../dist/MacroManager.toc
    fi
}

main "$@"