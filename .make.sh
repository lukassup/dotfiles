#!/usr/bin/env bash

##
# .make.sh
#
# This script creates symlinks
# to any dotfiles in $HOME

# Variable definitions

# The name of your dotfiles directory
dir='dotfiles'
# Absolute path
absdir="${HOME}/${dir}"
# Absolute path for backups
absdirold="${absdir}.old"

pushd "${absdir}"

# Get files in $ABSDIR
files+=(*)

# Exlude list
exclude=('README.md')

# for item in ${files[@]}; do
#     echo -n "'${item}' "
# done

echo

for x in ${!exclude[@]}; do
    for y in ${!files[@]}; do
        [[ "${files[y]}" == "${exclude[x]}" ]] && unset files[y]
    done
done

# for item in ${files[@]}; do
#     echo -n "'${item}' "
# done

cd "$HOME"

# Create $absdirold in $HOME
mkdir -pv "${absdirold}"
echo "'${absdirold}' created for backup."
echo

# Move any existing dotfiles in $HOME to $absdirold directory, then create
# symlinks from $HOME to any files in $absdir directory specified in $FILES.

for file in ${files[@]}; do

    # Move any existing dotfiles from $HOME to $absdirold
    if [[ -e "${HOME}/.${file}" ]]; then
        echo "'${HOME}/.${file}' exists"
        echo -n 'Moving: '
        mv -v ".${file}" "${absdirold}"
        # echo "'.${file}' -> '${absdirold}/.${file}'"
    fi

    # Create symlink to $FILE in $HOME
    echo -n 'Linking: '
    ln -vs "${dir}/${file}" ".${file}"
    # echo "'.${file}' -> '${dir}/${file}'"
    echo

done

