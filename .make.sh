#!/usr/bin/env bash

##
# .make.sh
#
# This script creates symlinks
# to any dotfiles in $HOME
##

# Variable definitions

# The name of your dotfiles directory
DIR="dotfiles"
# Absolute path
ABSDIR="${HOME}/${DIR}"
# Absolute path for backups
ABSDIROLD="${ABSDIR}_old"

cd "${ABSDIR}"

# Get files in $ABSDIR
FILES+=(*)

# Exlude list
EXCLUDE=("README.md" "zsh")

for item in ${FILES[@]}; do
    echo -n "'${item}' "
done

echo -ne "\n\n"

for x in ${!EXCLUDE[@]}; do
    for y in ${!FILES[@]}; do
        if [[ "${FILES[y]}" == "${EXCLUDE[x]}" ]]; then
            echo "Unset: ${FILES[$y]}"
            unset FILES[y]
        fi
    done
done

for item in ${FILES[@]}; do
    echo -n "'${item}' "
done

echo -ne "\n\n"

cd "${HOME}"

# Create $ABSDIROLD in $HOME
#mkdir -pv "${ABSDIROLD}"
echo "'${ABSDIROLD}' created for backup."
echo

# Move any existing dotfiles in $HOME
# to $ABSDIROLD directory, then create
# symlinks from $HOME to any files
# in $ABSDIR directory specified in $FILES.

for FILE in ${FILES[@]}; do

    # Move any existing dotfiles from $HOME to $ABSDIROLD
    if [[ -e "${HOME}/.${FILE}" ]]; then
        echo "'${HOME}/.${FILE}' exists"
        echo "Moving: '.${FILE}' -> '${ABSDIROLD}/.${FILE}'"
        # echo -n "Moving: "
        # mv -v ".${FILE}" "${ABSDIROLD}"
    fi

    # Create symlink to $FILE in $HOME
    echo "Linking: '.${FILE}' -> '${DIR}/${FILE}'"
    # echo -n "Linking: "
    # ln -vs "${DIR}/${FILE}" ".${FILE}"
    echo

done

