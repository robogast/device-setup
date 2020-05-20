#!/bin/bash

# Get script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

read -p 'GitHub email: ' useremail
read -p 'GitHub username: ' username

printf -v userheaderstring "[user]"
printf -v useremailstring "\temail = %s" "$useremail"
printf -v usernamestring "\tname = %s" "$username"
printf "%s\n%s\n%s\n" "$userheaderstring" "$useremailstring" "$usernamestring" >> $DIR/.gitconfig

cp $DIR/.gitconfig ~/

git update-index --skip-worktree $DIR/.gitconfig

./install-vscode.sh

./cuda-cudnn/cuda-cudnn-setup.sh
