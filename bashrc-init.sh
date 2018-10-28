# Download the last version of this file and source it
function bashrc_reinstall
{
    if [ -f ~/.bashrc-init.sh ];
    then
        rm -f ~/.bashrc-init.sh
    fi
    curl -s https://raw.githubusercontent.com/mouchimotte/dotfiles/master/bashrc-init.sh > ~/.bashrc-init.sh
    . ~/.bashrc-init.sh
    bashrc_update
}

# Init the git clone of dotfiles
function bashrc_init
{
    if [ -z "$PATH_TO_DOTFILES" ]; then
        PATH_TO_DOTFILES="/tmp/dotfiles/"
        if [ -d $PATH_TO_DOTFILES ]; then
            bashrc_update
        else
            mkdir $PATH_TO_DOTFILES
            cd $PATH_TO_DOTFILES
            git init
            git remote add -f origin https://github.com/mouchimotte/dotfiles.git
            git config core.sparseCheckout true
            echo "bashrc/" >> .git/info/sparse-checkout
            git pull --depth=1 origin master
        fi
    fi
}

# Auto-init for first start
bashrc_init

# Source all files
function bashrc_source
{
    if [ -d "$PATH_TO_DOTFILES/bashrc/" ]; then
        for file in $(ls $PATH_TO_DOTFILES/bashrc/*.sh); do
            . $file
        done
    fi
}

# Update from git and source it
function bashrc_update
{
    cd $PATH_TO_DOTFILES
    git pull --rebase
    bashrc_source
}
