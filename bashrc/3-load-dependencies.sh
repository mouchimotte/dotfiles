#
# Import ~/.inputrc from cloned project or github
#
if ! [ -f ~/.inputrc ]; then
    if [ -f "$PATH_TO_DOTFILES/inputrc/inputrc" ]; then
        cp "$PATH_TO_DOTFILES/inputrc/inputrc" ~/.inputrc
    else
        curl -s https://raw.githubusercontent.com/mouchimotte/dotfiles/master/inputrc/inputrc > ~/.inputrc
    fi
fi

#
# Download the git-promt from someone who have already coded it ;)
#
if ! [ -f ~/.git-prompt.sh ];
then
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
fi

#
# Import ~/.gitconfig from cloned project or github
#
if ! [ -f ~/.gitconfig ]; then
    if [ -f "$PATH_TO_DOTFILES/git/gitconfig" ]; then
        cp "$PATH_TO_DOTFILES/git/gitconfig" ~/.gitconfig
    else
        curl -s https://raw.githubusercontent.com/mouchimotte/dotfiles/master/git/gitconfig > ~/.gitconfig
    fi
fi
