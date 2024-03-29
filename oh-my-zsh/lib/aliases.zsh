## Alias configuration
#
# expand aliases before completing
#

# Push and pop directories on directory stack
# cd
alias ..='cd ..'
alias cd="pushd"
alias p="popd"

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

# Show history
alias history='fc -l 1'

alias afind='ack-grep -il'

# utility
alias where="command -v"
alias j="jobs -l"

# man
# alias man="man -L ja"

# ls
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
alias sl=ls # often screw this up
case "${OSTYPE}" in
    freebsd*|darwin*)
        alias ls="ls -G -w"
        ;;
    linux*)
        alias ls="ls --color"
        ;;
esac

# du
alias du="du -h"

# df
alias df="df -h"

# su
alias su="su -l"

# useful pipe function
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'

# pipe copy function
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi


## 完全に削除。
alias rr="command rm -rf"
## ファイル操作を確認する。
alias rm="rm -i"
# alias cp="cp -i"
alias mv="mv -i"

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

#screen
alias sc='screen'

# commands starting with % for pasting from web
alias %=' '

#@see http://d.hatena.ne.jp/mollifier/20101227/p1
autoload -Uz zmv
alias zmv='noglob zmv -W'
