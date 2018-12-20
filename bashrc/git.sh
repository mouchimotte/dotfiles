##
# GIT
##

# Remove git branches that do not have a remote tracking branch anymore
# source: https://gist.github.com/maldonado/2fa63770fcd54b92810d
function gprune ()
{
    git checkout master &&
        git pull --rebase &&
        git fetch --prune &&
        git branch -r |
            awk '{print $1}' |
            egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) |
            awk '{print $1}' |
            xargs git branch -d
}
