#!/bin/bash

# This is an installing script for init vim working environment.
#
# Assuming that the folder containing this file named ~/.vim

DIST=

BASE_NAME="$HOME/vimrc.bk-"
i=1
BACKUP_NAME=${BASE_NAME}${i}

# make link for vimrc and back up the original vimrc
ln4vimrc() 
{
    while [ -e ${BACKUP_NAME} ]
    do
        i=$(expr ${i} + 1)
        BACKUP_NAME=${BASE_NAME}${i}
    done

    if [ ! -f "vimrc" ]
    then
        echo "vimrc doesn't exists"
        exit -1
    fi

    ln -sf $HOME/.vim/vimrc $HOME/.vimrc &> /dev/null

    if [ ! $? -eq 0 ]
    then
        mv $HOME/.vimrc ${BACKUP_NAME}
        ln -s $HOME/.vim/vimrc $HOME/.vimrc
    fi

    if [ -f "gvimrc" ]; then
        ln -sf $HOME/.vim/gvimrc $HOME/.gvimrc &> /dev/null
    fi
}

# Evaluate the distribution of Linux current using
eval_dist()
{
    if cat /proc/version | grep -q -i "gentoo"; then
        DIST="gentoo"
    elif cat /proc/version | grep -q -i "ubuntu"; then
        DIST="ubuntu"
    fi
}

# check if vim is configured with python and cscope enabled
check_vim_config() {
    vim --version | grep -q "+python" && \
        vim --version | grep -q "+cscope"

    if [[ $? -ne 0 ]] ; then
        echo "Error: vim should be configured with 'python' and 'cscope' enabled!!"
        exit -1
    fi
}

## check if command 'vim' exist
check_vim_cmd()
{
    VIM="vim"
    if ! hash $VIM &> /dev/null; then
        echo "Error: vim command not found"
        echo "Error: you should install vim with python and cscope enabled"
        exit -1
    fi
}

# install clang base on your distribution
install_clang()
{
    if [[ $DIST = "gentoo" ]]; then
        sudo emerge clang
    else
        echo "Plase install clang manually!"
    fi

}

# check if clang is installed
check_clang()
{
    CLANG="clang"
    if ! hash $CLANG &> /dev/null; then
        echo "Error: vim will clang for completion"
        echo "Error: you should install clang first"
        read -p "would you like to install clang now? [Y/N]" ANS
        if [[ $ANS = "Y" ]] || [[ $ANS == "y" ]]; then
            install_clang
        else 
            exit -1
        fi
    fi
}

eval_dist
check_vim_cmd
check_vim_config
check_clang
ln4vimrc
