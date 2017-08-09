# Vim && Tmux 

This image combines `tmux` with `vim` and thus offers a portable, cli-based dev-environment. Both tools, as well as the `zsh`-shell this images uses, are tailored through a bunch of custom adjustments to match my local environment as close as possible.

The setup was inspired by [Keegan Lowensteins blog][blog1]-post which explains used configs in detail (and also talks about stuff which goes beyond this images' setup).

### So what's included:

- seemless pane-navigation (in and between `vim` and `tmux`) using `<CTRL>+l`, `<CTRL>+h` etc. 
- [vimux][vimux]-integration in `vim` to easily execute commands in `tmux`-panes 
-- use `<Leader>vp` for `:VimuxPromptCommand` / `<Leader>vl` for `:VimuxRunLastCommand`
-- I use a german keyboard where the default leader `\` is hard to use - turned to `,` instead
- [nerdtree][nerdtree]-integration in `vim` to browse workspace-content with ease
-- toggle it with `<F9>` or `<Leader>1`
- [vundle][vundle]-bundle manager which is triggered on first start and installs all plugins automatically
- [nord-vim][nord-vim] with [lightline][lightline] plugin to have a decent theme

### How to use

```
docker run --name project -ti -v $(pwd):/data schoeffm/vimux
```

This command will fire up a vimux container for the current project - you can exit it and re-enter later on

[![asciicast](https://asciinema.org/a/1yyrNLuhIfVVy0cvorhTGz0jk.png)](https://asciinema.org/a/1yyrNLuhIfVVy0cvorhTGz0jk)

[vimux]:https://github.com/benmills/vimux
[nerdtree]:https://github.com/scrooloose/nerdtree
[vundle]:https://github.com/VundleVim/Vundle.vim
[nord-vim]:https://github.com/arcticicestudio/nord-vim
[blog1]:https://blog.bugsnag.com/tmux-and-vim/
[blog2]:https://teamgaslight.com/blog/vim-plus-tmux-a-perfect-match
[lightline]:https://github.com/itchyny/lightline.vim
