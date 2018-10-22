The idea come from Julien Palard. The purpose was to pull his own dotfiles from the web to anywhere (ex: all new server he put online).
His own repository: https://github.com/JulienPalard/dotfiles.

# bashrc/
You will find in this folder all files who will help your daily use of `bash`.
All files have `.sh` extension because they can be used standealone.

### Using it
Add those lines to your `.bashrc`

```bash
if [ -d ~/projects/dotfiles/bashrc/ ]; then
    for file in $(ls ~/projects/dotfiles/bashrc/*.sh); do . $file; done
fi
```

Then reload your bashrc by hitting:

```bash
$ . ~/.bashrc
```

# inputrc/
This folder contains one file who is helping you to browse speedly your history.

### Installation
Copy/Paste the `.inputrc` file into yout home folder (ex: `/home/mouchi/` for me).

*Maybe you have to restart your session to view change.*

### How to
Then, when you start typing some already typed command in your terminal, you can browse all your history who started by the typed characters with arrows up and down.
