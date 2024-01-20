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

    # move to workspace to run git check
    cd "$MACRO_MANAGER_WORKSPACE_PATH"

    # detect untracked files
    local untracked_files
    untracked_files="$(git ls-files . --exclude-standard --others)"

    # report on any untracked files
    if [ -n "$untracked_files" ]; then
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      echo "!!                                                                            !!"
      echo "!! There are untracked files, so they will not be included in bundle.         !!"
      echo "!!                                                                            !!"
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    fi

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"