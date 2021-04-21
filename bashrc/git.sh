##
# GIT
##

# Remove git branches that do not have a remote tracking branch anymore
# source: https://gist.github.com/maldonado/2fa63770fcd54b92810d
function gprune ()
{
    local branch="$1";
    if [[ -z "$branch" ]]; then
        if [[ -z $(git branch --list "main") ]]; then
            branch="master"
        else
            branch="main"
        fi
    fi

    if ! [[ "$branch" =~ ^(main|master)$ ]]; then
        echo "Branch name "$branch" not in white list of principal branches:"
        echo "main, master"
        return 1
    fi

    git stash &&
    git checkout $branch &&
    git pull --rebase &&
    git fetch --prune &&
    (git branch -r |
        awk '{print $1}' |
        egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) |
        awk '{print $1}' |
        xargs git branch -d) &&
    git stash pop
}
