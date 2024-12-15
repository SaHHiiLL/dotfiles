###
### Added:  December 15, 2024
### By:     SaHHiiLL
###
#!/usr/bin/env bash

programing_dir() {
    find ~/programing/ -maxdepth 2 -type d | tail -n +2
}

home_dir() {
    find ~ -maxdepth 1 -type d -not -name '.*' | tail -n +2
}

dotfiles() {
    find ~/.config/ -maxdepth 1 -type d
}

path=$(
    {
        echo $(programing_dir);
        echo $(home_dir);
        echo $(dotfiles);
    } | tr ' ' '\n' | fzf
)

if [[ $path ]]; then
    cd $path
fi

$SHELL
