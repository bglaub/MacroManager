#!/bin/bash

# make sure to error out
set -eu

function main() {

    # make all globals accessible
    # shellcheck source=/dev/null
    source "${MACRO_MANAGER_WORKSPACE_PATH}/ops/global.sh"
    
    echo ""
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "DELETING STORED VARIABLES"
    echo "--------------------------------------------------------------------------------"
    
    # delete any stored variables
    cd "${WOW_ADDON_DIRECTORY}/../../WTF"
    find . -name "MacroManager.lua*" -type f -delete -print

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"