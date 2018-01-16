# Screen session gesture
#
# /!\ it's draft /!\
#
# You can manage 2 sessions:
# - perso
# - main
#
# They respictivly have a windows' conf:
# - perso: dev dev bash
# - main: screen-1 screen-2 screen-3 --- etc ---
#
# you can change those conf of windows at lines 35 and 39
#

myscreen()
{
    if [[ "$1" == "" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]
    then
       echo "Usage: ./myscreen [ -l | -h ] [ <session name> ]"
       return 0
    fi

    if [[ $1 == -* ]]
    then
        if [[ "$1" == "-l" ]] || [[ "$1" == "-ls" ]]
        then
            screen -ls
        fi
        return 0
    fi

    if [ "$1" == "perso" ]
    then
        WINDOWS=$(echo dev dev bash)
        SESSION="perso"
    elif [ "$1" == "main" ]
    then
        WINDOWS=$(echo screen-1 screen-2 screen-3 --- etc ---)
        SESSION="main"
    fi

    if screen -list | grep -q "$SESSION"
    then
        screen -DUR "$SESSION"
    else
        screen -dmS "$SESSION"
        NUM=0
        for WINDOW in $(echo "$WINDOWS")
        do
            screen -S "$SESSION" -X screen
            screen -S "$SESSION" -p $NUM -X title "$WINDOW"
            NUM=$((NUM + 1))
        done
        screen -DUR "$SESSION"
    fi
}
