## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

## file rename magick
bindkey "^[m" copy-prev-shell-word

## pager 
export PAGER=less
export LC_CTYPE=$LANG
