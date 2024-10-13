#!/bin/bash

force_remove() {
    for item in "$@"; do
        git rm -r --cached "$item" 2>/dev/null || true
        git update-index --force-remove "$item" 2>/dev/null || true
    done
}

cd ~/.config/nvim || {
    echo "Failed to change directory to ~/.config/nvim"
    exit 1
}

force_remove "sh" "lazy-lock.json"
git add --all -- ':!:sh' ':!:lazy-lock.json'
git commit -m "​"
git push -f -u https://1XC1XC:$(cat ~/Files/Tokens/Github/Github.md)@github.com/1XC1XC/NvChad.git main
