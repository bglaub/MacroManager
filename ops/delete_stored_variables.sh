#!/bin/sh

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}
    
    # delete any stored variables
    cd "${addon_directory}/../../WTF"
    find . -name \*MacroManager* -type f -delete
}

main "$@"