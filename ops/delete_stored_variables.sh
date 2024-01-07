#!/bin/bash

# make sure to error out
set -eu

function main() {
    # make all globals accessible
    # shellcheck source=ops/global.sh
    . ./global.sh
    
    local addon_directory=${1:-"${DEFAULT_ADDON_DIRECTORY}"}
    
    echo ""
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "DELETING STORED VARIABLES"
    echo "--------------------------------------------------------------------------------"
    
    # delete any stored variables
    cd "${addon_directory}/../../WTF"
    find . -name "MacroManager.lua*" -type f -delete -print

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"