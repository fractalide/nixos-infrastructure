#!/run/current-system/sw/bin/bash


cd `dirname $0`
sudo rsync --filter="protect /hardware-configuration.nix" \
           --filter="protect /hostname" \
           --filter="protect /nixpkgs" \
           --filter="protect /private" \
           --filter="protect /release" \
           --filter="exclude,s *.gitignore" \
           --filter="exclude,s *.gitmodules" \
           --filter="exclude,s *.git" \
           --filter="exclude .*.swp" \
           --filter="exclude Session.vim" \
           --delete --recursive --perms \
           ./ /etc/nixos/

if [ $# -eq 0 ]; then
  operation='switch'
else
  operation=$1
fi
cd $wd
sudo NIX_CURL_FLAGS='--retry=100' nixos-rebuild --keep-failed $operation
