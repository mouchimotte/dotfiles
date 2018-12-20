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

# Git alias
# Remove git branches that do not have a rmote tracking branch anymore
# source: https://gist.github.com/maldonado/2fa63770fcd54b92810d
alias git_prune="git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d"
