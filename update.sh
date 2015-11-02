#!/run/current-system/sw/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

git pull --rebase
sudo nix-channel --update
./rebuild.sh
