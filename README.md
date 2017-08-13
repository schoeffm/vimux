# Vim && Tmux 

This image combines `tmux` with `vim` and thus offers a portable, cli-based dev-environment. Both tools, as well as the `zsh`-shell this images uses, are tailored through a bunch of custom adjustments to match my local environment as close as possible.

The setup was inspired by [Keegan Lowensteins blog][blog1]-post which explains used configs in detail (and also talks about stuff which goes beyond this images' setup).

### So what's included:

##### Base-Version (`schoeffm/vimux`)
- seemless pane-navigation (in and between `vim` and `tmux`) using `<CTRL>+l`, `<CTRL>+h` etc. 
- [vimux][vimux]-integration in `vim` to easily execute commands in `tmux`-panes 
    - use `<Leader>vp` for `:VimuxPromptCommand` / `<Leader>vl` for `:VimuxRunLastCommand`
    - I use a german keyboard where the default leader `\` is hard to use - turned to `,` instead
- [nerdtree][nerdtree]-integration in `vim` to browse workspace-content with ease
    - toggle it with `<F9>` or `<Leader>1`
- [vundle][vundle]-bundle manager which is triggered on first start and installs all plugins automatically
- [nord-vim][nord-vim] with [lightline][lightline] plugin to have a decent theme

##### Powerline-Version (`schoeffm/vimux:powerline`)
- [powerline][powerline] for `tmux` as well as `zsh` (as well as `python` which is a prerequisite to run `powerline` - that's the reason for a separate image-version)

##### Docker-Version (`schoeffm/vimux:docker`)
- `docker` and `docker-compose` CLI tools. 
    - In order to run this image-version you'll have to map your local `docker.sock` socket to the container - by that means you'll be able to use your local docker-host and build (local) images from within `vimux`-container.

### How to use

After cloning the repository you should be able to use the `run.sh` script which provides you a menu to select a specific `vimux`-image version.

```
./run.sh
Select one of the follin' versions:
1) vimux
2) powerline
3) withDocker
#? _
```

All these commands will mount the current users `home` directory into the working-dir of the container - so you should be able to start right away.

Of course you're also able to run the container manually, like:

```
# will run the base-version which maps the current working directory into the container
docker run --name vimux -ti -v $(pwd):/data schoeffm/vimux

# same as above but this one uses the powerline-version
docker run --name vimux -ti -v $(pwd):/data schoeffm/vimux:powerline

# this one maps the docker.sock into the container
docker run --name vimux -ti -v $(pwd):/data -v /var/run/docker.sock:/var/run/docker.sock schoeffm/vimux:docker
```

See also the followin' screencast for an example:

[![asciicast](https://asciinema.org/a/1yyrNLuhIfVVy0cvorhTGz0jk.png)](https://asciinema.org/a/1yyrNLuhIfVVy0cvorhTGz0jk)

### Build from scratch

```
./buildAll.sh                                   # will build all container one by one
```
```
docker build .                                  # builds the default version - schoeffm/vimux
docker build -f Dockerfile.powerline .          # adds powerline to tmux/zsh as well - schoeffm/vimux:powerline
docker build -f Dockerfile.withDocker .         # also installs docker cli-tools - schoeffm/vimux:docker
```
   

[vimux]:https://github.com/benmills/vimux
[nerdtree]:https://github.com/scrooloose/nerdtree
[vundle]:https://github.com/VundleVim/Vundle.vim
[nord-vim]:https://github.com/arcticicestudio/nord-vim
[blog1]:https://blog.bugsnag.com/tmux-and-vim/
[blog2]:https://teamgaslight.com/blog/vim-plus-tmux-a-perfect-match
[lightline]:https://github.com/itchyny/lightline.vim
[powerline]:https://github.com/powerline/powerline
