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

# Refresh named container

function dcrefresh ()
{
    CONTAINER_ID=$(docker ps -a | grep "$1" | cut -f1 -d' ')
    VOLUME_ID=""
    if [ "$CONTAINER_ID" != "" ]; then
        VOLUME_ID=$(docker inspect -f '{{ .Mounts }}' "$CONTAINER_ID" | sed 's/.*volume //' | cut -f1 -d' ')
    fi
    docker compose stop "$1"
    echo "y" | d compose rm "$1"
    if [ "$VOLUME_ID" != "" ]; then
        docker volume rm "$VOLUME_ID"
    fi
    docker compose up --build "$1"
}
