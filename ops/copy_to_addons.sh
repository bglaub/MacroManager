#!/bin/bash

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    # shellcheck source=ops/global.sh
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}
    local macro_manager_directory="${addon_directory}/MacroManager"

    # re-establish distribution
    ./bundle.sh

    # remove MacroManager addon if it exists
    if [ -d "$macro_manager_directory" ]; then
        rm -rf "$macro_manager_directory"
    fi

    # copy all the distribution files to the addon directory
    cp -r ../dist* "$addon_directory"
}

main "$@"