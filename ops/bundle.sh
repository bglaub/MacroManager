#!/bin/bash

# make sure to error out
set -eu

function main() {
    
    echo ""
    echo ""
    echo "--------------------------------------------------------------------------------"
    echo "BUNDLING"
    echo "--------------------------------------------------------------------------------"

    # remove .release directory if it already exists
    if [ -d "${MACRO_MANAGER_WORKSPACE_PATH}/.release" ]; then
        rm -rf "${MACRO_MANAGER_WORKSPACE_PATH}/.release"
    fi

    # recreate .release directory
    mkdir -p "${MACRO_MANAGER_WORKSPACE_PATH}/.release"

    # create pkgmeta-dev to allow MacroManagerDevTools
    yq 'del(.ignore[] | select(. == "MacroManagerDevTools/*"))' "${MACRO_MANAGER_WORKSPACE_PATH}/.pkgmeta" > "${MACRO_MANAGER_WORKSPACE_PATH}/.pkgmeta-dev"
    yq -i '.move-folders.MacroManager/MacroManagerDevTools =  "MacroManagerDevTools"' "${MACRO_MANAGER_WORKSPACE_PATH}/.pkgmeta-dev"

    # move to packager to run the release
    cd "$MACRO_MANAGER_PACKAGER_PATH"

    # run release
    ./release.sh -z -d -t "$MACRO_MANAGER_WORKSPACE_PATH" -m "${MACRO_MANAGER_WORKSPACE_PATH}/.pkgmeta-dev"

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"