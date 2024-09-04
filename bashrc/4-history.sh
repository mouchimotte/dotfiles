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
shopt -s histreedit
shopt -s histverify
shopt -s no_empty_cmd_completion

# Control cmd who a registered in history (default ignoreboth):
# - ignorespace: don’t save lines which begin with a <space> character
# - ignoredups: don’t save lines matching the previous history entry
# - ignoreboth: use both ‘ignorespace’ and ‘ignoredups’
# - erasedups: eliminate duplicates across the whole history
export HISTCONTROL=ignoreboth:erasedups
# Add the date in the history file to know when it have been executed last time
# export HISTTIMEFORMAT="%F %T "

# history -n reads all lines from $HISTFILE that may
#            have occurred in a different terminal since the last carriage return
# history -w writes the updated buffer to $HISTFILE
# history -c wipes the buffer so no duplication occurs
# history -r re-reads the $HISTFILE, appending to the now blank buffer
export PROMPT_COMMAND="history -n; history -w; history -c; history -r"

# the awk script stores the first occurrence of each line it encounters.
#     tac reverses it, and then reverses it back so that it can be saved
#     with the most recent commands still most recent in the history
tac "$HISTFILE" | awk '!x[$0]++' > /tmp/histfile  && tac /tmp/histfile > "$HISTFILE"

# rm the /tmp file
rm -f /tmp/histfile

