#!/bin/bash

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    # shellcheck source=ops/global.sh
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}

    # re-establish release
    ./bundle.sh
    
    echo ""
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "Copying"
    echo "--------------------------------------------------------------------------------"

    # remove macros from addon directories
    cd ../.release
    for dir in *; do (echo "Removing ${addon_directory}/${dir}..." && rm -rf "${addon_directory:?}/${dir}"); done

    # copy all the release files to the addon directory
    echo "Copying addons to ${addon_directory}..."
    cp -r -- * "$addon_directory"

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"