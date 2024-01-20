#!/bin/bash

# make sure to error out
set -eu

function main() {

    # make all globals accessible
    # shellcheck source=/dev/null
    source "${MACRO_MANAGER_WORKSPACE_PATH}/.devcontainer/ops/global.sh"

    # re-establish bundle
    "$MACRO_MANAGER_WORKSPACE_PATH"/.devcontainer/ops/bundle.sh
    
    echo ""
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "Copying"
    echo "--------------------------------------------------------------------------------"

    # remove macros from addon directories
    cd "${MACRO_MANAGER_WORKSPACE_PATH}/.release"
    for dir in *; do (echo "Removing ${WOW_ADDON_DIRECTORY}/${dir}..." && rm -rf "${WOW_ADDON_DIRECTORY:?}/${dir}"); done

    # copy all the release files to the addon directory
    echo "Copying addons to ${WOW_ADDON_DIRECTORY}..."
    cp -r -- * "$WOW_ADDON_DIRECTORY"

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"