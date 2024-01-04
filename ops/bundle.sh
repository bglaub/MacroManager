#!/bin/sh

# make sure to error out
set -eu

function main() {
    
    # make all globals accessible
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
}

main "$@"