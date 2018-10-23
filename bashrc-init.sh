#
# Init the Autoloading
#
if [ -z "$PATH_TO_DOTFILES" ]; then
    PATH_TO_DOTFILES="/tmp/dotfiles/"
    mkdir $PATH_TO_DOTFILES
    cd $PATH_TO_DOTFILES
    git init
    git remote add -f origin https://github.com/mouchimotte/dotfiles.git
    git config core.sparseCheckout true
    echo "bashrc/" >> .git/info/sparse-checkout
    git pull --depth=1 origin master
fi

if [ -d "$PATH_TO_DOTFILES/bashrc/" ]; then
    for file in $(ls "$PATH_TO_DOTFILES/bashrc/*.sh"); do . $file; done
fi
