#!/bin/bash

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}
    local macro_manager_directory="${addon_directory}/MacroManager"

    # re-establish distribution
    ./bundle.sh

    # remove MacroManager addon if it exists
    if [ -d "$macro_manager_directory" ]; then
        rm -rf "$macro_manager_directory"
    fi

    # create the macro manager addon directory
    mkdir -p "$macro_manager_directory"

    # copy all the distribution files to the addon directory
    cp -r ../dist/* "$macro_manager_directory"
}

main "$@"