#
# File who will contain the known list of ssh-agent socket and pid associated
#
SSH_REAGENT_AGENT_LIST_FILE="$HOME/.ssh/ssh_reagent_agent_list"

#
# Alias of ssh-agent to add option
# here we force the hmac sha256
#
alias ssh-agent='ssh-agent -E sha256'

# Function to test the existence of file
ssh-reagent-ensure-file-exists ()
{
    if [ ! -f $SSH_REAGENT_AGENT_LIST_FILE ]; then
        if ! touch $SSH_REAGENT_AGENT_LIST_FILE; then
            return 1
        fi
    fi
}

#
# Function to create a ssh-agent and add their socket/pid to the list
#
ssh-reagent-add-named-agent ()
{
    name="$1"
    if [ -n "$name" ]; then
        if grep -q $name $SSH_REAGENT_AGENT_LIST_FILE || [ -d "/tmp/ssh-$name/" ]; then
            echo "Ssh Agent named '$name' already exists"
            name=""
        fi
    fi

    #start a new agent and get auth_sock and pid informations
    infos="$(ssh-agent)"

    #extract auth_sock and pid informations
    ssh_auth_sock="$(echo $infos | cut -d= -f2 | cut -d';' -f1)"
    ssh_agent_pid="$(echo $infos | cut -d= -f3 | cut -d';' -f1)"

    #rename agent file
    if [ -n "$name" ]; then
        mv $ssh_auth_sock "/tmp/ssh-$name/"
        ssh_auth_sock="$(echo $ssh_auth_sock | sed 's/ssh-.*\//ssh-$name\//')"
    fi

    #add info about new ssh-agent at the end of file
    echo "$ssh_agent_pid""_""$ssh_auth_sock" >> $SSH_REAGENT_AGENT_LIST_FILE
}

#
# Function to clean gost ssh-agent information contained in the FILE
# or Processus launched by the current user but not in the FILE
#
ssh-reagent-clean-existing ()
{
    # first check those in $SSH_REAGENT_AGENT_LIST_FILE
    while IFS= read -r line; do
        # extract only the pid form the line
        ssh_agent_pid=$(echo $line | cut -d'_' -f 1)

        # check if pid is associate to process other than ssh-agent or empty, we delete it
        # - if empty || process name is not "ssh-agent"
        if [ ! -n "$(ps -q $ssh_agent_pid -o comm=)" ] || [ "ssh-agent" != "$(ps -q $ssh_agent_pid -o comm=)" ]; then
            if ! sed -i "/^$ssh_agent_pid/d" $SSH_REAGENT_AGENT_LIST_FILE; then
                return 1
            fi
        fi
    done < "$SSH_REAGENT_AGENT_LIST_FILE"

    # then check those in processlist
    for ssh_agent_pid in $(pidof ssh-agent); do
        # if owner isn't us, continue...
        if [ "$(whoami)" != "$(ps -o user= -p $ssh_agent_pid)" ]; then
            continue
        fi

        # if pid isn't knowed by our list, we kill it
        if ! grep -q $ssh_agent_pid $SSH_REAGENT_AGENT_LIST_FILE; then
            if ! kill $ssh_agent_pid; then
                return 1
            fi
        fi
    done
}

ssh-reagent ()
{
    # check file and clean existing first
    if ! ssh-reagent-ensure-file-exists || ! ssh-reagent-clean-existing; then
        return 1
    fi

    # say what to do
    echo "----- Choose Socket or Create one:"

    # make the list to choose
    # + add option to be able to create a new ssh-agent
    choose_options="$(cat $SSH_REAGENT_AGENT_LIST_FILE) Or-create-new-one"

    # prompt a choose-form
    select option in $choose_options; do
        # if option have been selected
        if [ -n "$option" ]; then
            # if we have choose to create a new ssh-agent
            if [ "$option" == "Or-create-new-one" ]; then
                # create new ssh-agent
                if ! ssh-reagent-add-named-agent; then
                    return 1
                fi

                # and relaunch the choose of agent
                ssh-reagent
                return
            # else if we have choose a socket to be connected with
            else
                # export auth_sock and pid informations to link current user session to socket choosen
                export SSH_AUTH_SOCK="$(echo $option | cut -d'_' -f2)"
                export SSH_AGENT_PID="$(echo $option | cut -d'_' -f1)"
            fi
        fi

        # quit after any choose (avoid loop)
        return
    done
}
