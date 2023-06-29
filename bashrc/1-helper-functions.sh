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

echo_red () { echo -e "${COLOR_RED}$1${COLOR_NO}"; }
echo_green () { echo -e "${COLOR_GREEN}$1${COLOR_NO}"; }
echo_yellow () { echo -e "${COLOR_YELLOW}$1${COLOR_NO}"; }

parse_git_branch()
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}
