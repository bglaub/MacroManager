#!/bin/bash

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    # shellcheck source=global.sh
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}
    
    # delete any stored variables
    cd "${addon_directory}/../../WTF"
    find . -name "\*MacroManager*" -type f -delete
}

main "$@"