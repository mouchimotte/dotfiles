# dotfiles
Files containing some helpers in bash or other 

## Installation
Add those lines to your `.bashrc`

```
if [ -d ~/projects/dotfiles/bashrc/ ]; then
    for file in $(ls ~/projects/dotfiles/bashrc/*.sh); do . $file; done
fi
```
