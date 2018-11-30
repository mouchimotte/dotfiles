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
