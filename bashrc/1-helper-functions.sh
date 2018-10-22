COLOR_BG_RED='\033[0;41m'
COLOR_BG_GREEN='\033[0;42m'
COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[0;33m'
COLOR_NO='\033[00m'

ko () {
    echo -e "${COLOR_BG_RED}KO${COLOR_NO} $@"
    return 1
}

ok () {
    echo -e "${COLOR_BG_GREEN}OK${COLOR_NO} $@"
}

okko () {
    if ! $@; then
        ko $@
    else
        ok $@
    fi
}

title () {
    echo ""
    echo -e "${COLOR_YELLOW}---------- $1${COLOR_NO}"
}

parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}
