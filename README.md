The idea come from Julien Palard. The purpose was to pull his own dotfiles from the web to anywhere (ex: all new server he put online).
His own repository: https://github.com/JulienPalard/dotfiles.

# bashrc/
You will find in this folder all files who will help your daily use of `bash`.
All files have `.sh` extension because they can be used standealone.

### Using it
Add those lines to your `.bashrc`

```bash
if ! [ -f ~/.bashrc-init.sh ];
then
    curl -s https://raw.githubusercontent.com/mouchimotte/dotfiles/master/bashrc-init.sh > ~/.bashrc-init.sh
    . ~/.bashrc-init.sh
fi
```

Then reload your bashrc by hitting:

```bash
$ . ~/.bashrc
```

# inputrc/
This folder contains one file who is helping you to browse speedly your history.

### Installation
The file import is managed by a `./bashrc/3-load-dependencies.sh` file.

### How to
Then, when you start typing some already typed command in your terminal, you can browse all your history who started by the typed characters with arrows up and down.

# git/
This folder contains my own Git config.

### Installation
The file import is managed by a `./bashrc/3-load-dependencies.sh` file.

### How to
See the content of file to know which config is set by default and which alias have been available now.
