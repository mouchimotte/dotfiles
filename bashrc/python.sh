function activate ()
{
    if ! test -f 'venv/bin/activate' && ! test -f 'bin/activate' && ! test -f 'activate'
    then
        echo_red "No binary 'activate' found here !"
        return 1
    fi
    
    if type deactivate &>/dev/null
    then
        echo_green "Already activated !"
        return 0
    fi
    if test -f 'venv/bin/activate'
    then
        . venv/bin/activate
    elif test -f 'bin/activate'
    then
        . bin/activate
    else
        . activate
    fi
}

alias FAILED="pytest -vv"

