#
# Bash History
#

# Add the time to history lines
# export HISTTIMEFORMAT="%Y-%m-%d %T "

# Increase the history number of lines (default 1000)
export HISTSIZE=-1
# Increase the history number of lines in the file (default 2000, negative mean no limit)
export HISTFILESIZE=-1

# Append rather than overwrite the history
shopt -s histappend
shopt -s histappend histreedit histverify
shopt -s no_empty_cmd_completion
# Append immediately (right after being executed) instead of wait the session is terminated
#PROMPT_COMMAND='$PROMPT_COMMAND; history -a'
#PROMPT_COMMAND='history -a'
# !!! uncompatible with current implem of _git_ps1

# Control cmd who a registered in history (default ignoreboth):
# - ignorespace: don’t save lines which begin with a <space> character
# - ignoredups: don’t save lines matching the previous history entry
# - ignoreboth: use both ‘ignorespace’ and ‘ignoredups’
# - erasedups: eliminate duplicates across the whole history
export HISTCONTROL=ignoreboth:erasedups
# Add the date in the history file to know when it have been executed last time
# export HISTTIMEFORMAT="%F %T "
