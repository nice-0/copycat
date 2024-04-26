#!/bin/bash

pushd /copycat 1 2>/dev/null

git remote set-url origin git@github.com:c-pyc-t/copycat.git
git config user.name c-pyc-t
git config user.email copycat@imp.nz
git config core.sshCommand "ssh -i /static/console/keys/sys/ssh_system.key"

TIMESTAMP=$(date --rfc-3339=ns)

git add -A 
git commit -F- <<EOF
 
 copycat

$TIMESTAMP

$(nixos-rebuild --flake /copycat/cfg#copycat list-generations)

    へ
（• ˕ •マ
   ~mew.
EOF
git push
