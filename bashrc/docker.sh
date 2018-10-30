##
# DOCKER
##

alias d="docker"
alias dps="d ps -a"

# Purge all unused volumes / images and make system prune at the end
function dpurge ()
{
    if [ "$(docker volume ls -q)" != "" ]; then
        docker volume rm $(docker volume ls -q)
    fi

    if [ "$(docker image ls -q)" != "" ]; then
        docker image rm $(docker image ls -q)
    fi
    echo y | docker system prune
}

##
# DOCKER COMPOSE
##

alias dc="docker-compose"
alias dcps="dc ps"
alias dcup="dc up -d"
alias dcdown="dc down"
alias dcexec="docker-compose exec"

function dcbash ()
{
    dcexec "$1" bash
}

# Refresh named container

function dcrefresh ()
{
    dc stop "$1" && \
        echo "y" | dc rm "$1" && \
        d volume rm $(d volume ls -q | grep "$1") && \
        dcup --build "$1"
}
