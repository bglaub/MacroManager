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
    if [ -d "../.release" ]; then
        echo "Removing .release directory..."
        rm -rf ../.release
    fi

    # recreate .release directory
    echo "Creating .release directory..."
    mkdir -p ../.release

    # copy addons to .release
    echo "Copying MacroManager to .release..."
    cp -r ../MacroManager ../.release
    echo "Copying MacroManagerDevTools to .release..."
    cp -r ../MacroManagerDevTools ../.release

    echo "--------------------------------------------------------------------------------"
    echo ""
    echo ""
}

main "$@"