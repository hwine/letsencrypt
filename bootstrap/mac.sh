#!/bin/sh -e
if ! hash brew 2>/dev/null; then
    echo "Homebrew Not Installed\nDownloading..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install augeas
brew install dialog

if ! hash pip 2>/dev/null; then
    echo "pip Not Installed\nInstalling python from Homebrew..."
    brew install python
fi

if ! hash virtualenv 2>/dev/null; then
    echo "virtualenv Not Installed\nInstalling with pip"
    # homebrew doesn't require sudo, but a global install of virtualenv would
    # installation for just this user should succeed
    pip install --user virtualenv
    # however, the userinstallation bin dir may not be part of the user's PATH
    if ! hash virtualenv 2>/dev/null; then
        echo "virtualenv not in path\nPlease add & rerun"
        exit 1
    fi
fi
