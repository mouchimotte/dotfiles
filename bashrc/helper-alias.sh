# Generic alias
alias ls='ls --color=auto'
alias l='ls -lah'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='LANG=C grep --color=auto'
alias grepr='grep -rn'
alias emacs='emacs -nw'
alias e='emacs'

# SSH alias
alias fingerprint='find /etc/ssh -name "*.pub" -exec ssh-keygen -lf {} \; -exec ssh-keygen -E md5 -lf {} \; | tr " " "\t"'

# Helpers
function len ()
{
    python -c "import sys; strings = sys.argv[1:]; print(\"\n\".join([_s + ': ' + str(len(_s)) for _s in strings]));" $@
}

function uuid_to_int ()
{
    python -c "from uuid import UUID; import sys; ids = sys.argv[1:]; print(\"\n\".join([_id + \": \" + str(UUID(_id).int) for _id in ids]));" $@
}

function int_to_uuid ()
{
    python -c "from uuid import UUID; import sys; ids = sys.argv[1:]; print(\"\n\".join([_id + \": \" + str(UUID(int=int(_id))) for _id in ids]));" $@
}

function dunno_ascii ()
{
    echo "¯\_(ツ)_/¯"
}
alias ascii_dunno="dunno_ascii"
