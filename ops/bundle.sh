#!/bin/bash

# make sure to error out
set -eu

function main() {

    # remove .release directory if it already exists
    if [ -d "../.release" ]; then
        rm -rf ../.release
    fi

    # recreate .release directory
    mkdir -p ../.release

    # remove .packager directory if it already exists
    if [ -d "../.packager" ]; then
        rm -rf ../.packager
    fi

    # move up one directory to clone packager off the root
    cd ../

    # pull down BigWigMods packager
    git clone https://github.com/BigWigsMods/packager.git .packager

    # move to .packager to run the release
    cd .packager

    # run release
    ./release.sh -z -d -t "$PWD/.." -m "$PWD/../.pkgmeta-dev"
}

main "$@"