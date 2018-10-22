#
# Download the git-promt from someone who have already coded it ;)
#
if ! [ -f "~/.git-prompt.sh" ]
then
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > "~/.git-prompt.sh"
fi

#
# Review the PS1
#
. ~/.git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "'"$PS1"'" "\\\$ "'
