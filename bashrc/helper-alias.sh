# Generic alias
alias l='ls -lah --color=auto'
alias rm='rm -i'
alias mv='mv -i'
alias grep='LANG=C grep --color=auto'
alias grepr='grep -rn'
alias emacs='emacs -nw'
alias e='emacs'

# SSH alias
alias fingerprint='find /etc/ssh -name "*.pub" -exec ssh-keygen -lf {} \; -exec ssh-keygen -E md5 -lf {} \; | tr " " "\t"'
