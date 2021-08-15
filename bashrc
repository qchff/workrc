# alias {{{
alias ll='ls -l -FHG --color'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias cctags='ctags -f .tags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ '
# alias phptags='ctags -R --file-scope=yes --sort=yes --fields=+afikKlmnsSzt --languages=PHP --extra=+fq'
alias pytags='ctags -f .tags -R --fields=+iaS --extra=+fq --languages=python'
alias phptags='ctags -f .tags -R --fields=+iaS --extra=+fq --languages=php'
alias go2tags='gotags -f .tags -silent -R --sort=true *'
alias restart_en0='sudo ifconfig en0 down && sudo ifconfig en0 up'
alias start_proxy='export http_proxy="127.0.0.1:8080" && export https_proxy="127.0.0.1:8080"'
alias tx_ssh='ssh ubuntu@139.155.52.60'
alias mbrew='arch -x86_64 brew'

# history命令设置
HISTSIZE=3000
HISTFILESIZE=3000
HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignoredups
# 多终端共享history
shopt -s histappend
# 实时追加，而不是退出保存
PROMPT_COMMAND="history -a"


export BASH_SILENCE_DEPRECATION_WARNING=1

if hash zssh 2>/dev/null; then
    alias ssh='TERM=xterm zssh'
fi
if hash mvim 2>/dev/null; then
   alias vim='mvim -v'
fi

source ~/.git-completion.bash

# }}}

# ENV {{{
# brew install coreutils GUN CMD
PATH="/usr/local/opt/coreutils/libexec/gnubin:~/bin/:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# LS COLORES, dir colors from https://github.com/seebi/dircolors-solarized.git
eval `dircolors -b $HOME/.dir_colors`

# brew install autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# brew install bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# https://github.com/skywind3000/z.lua/blob/master/README.cn.md
# eval "$(lua $HOME/Code/open_source/z.lua/z.lua  --init bash)" 

# export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[38;5;246m\][\[$(tput sgr0)\]\[\033[38;5;32m\]\u\[$(tput sgr0)\]\[\033[38;5;246m\]@\
\[$(tput sgr0)\]\[\033[38;5;32m\]mac\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]\
\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;32m\]\W\[$(tput sgr0)\]\[\033[38;5;246m\]]\\$\
\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# }}}

# fucntions {{{
function title {
    echo -ne "\033]0;"$*"\007"
}
# bdssh complete, @uses ~/bin/bds_hosts.txt
_completebdssh() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    if [[ ${COMP_CWORD} == 1 ]] ; then
        local wordlist=$(cat ~/bin/bds_hosts.txt)
    fi
    if [[ ${COMP_CWORD} == 2 ]] ; then
        local wordlist=""
    fi
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- ${curw}))
    return 0
}
complete -F _completebdssh bds

###-begin-leetcode-completions-###
#
# yargs command completion script
#
# Installation: /usr/local/bin/leetcode completion >> ~/.bashrc
#    or /usr/local/bin/leetcode completion >> ~/.bash_profile on OSX.
#
_yargs_completions()
{
    local cur_word args type_list

    cur_word="${COMP_WORDS[COMP_CWORD]}"
    args=("${COMP_WORDS[@]}")

    # ask yargs to generate completions.
    type_list=$(/usr/local/bin/leetcode --get-yargs-completions "${args[@]}")

    COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )

    # if no match was found, fall back to filename completion
    if [ ${#COMPREPLY[@]} -eq 0 ]; then
      COMPREPLY=( $(compgen -f -- "${cur_word}" ) )
    fi

    return 0
}
complete -F _yargs_completions leetcode
###-end-leetcode-completions-###

function _go() {
  cur="${COMP_WORDS[COMP_CWORD]}"
  case "${COMP_WORDS[COMP_CWORD-1]}" in
    "go")
      comms="build clean doc env bug fix fmt generate get install list run test tool version vet"
      COMPREPLY=($(compgen -W "${comms}" -- ${cur}))
      ;;
    *)
      files=$(find ${PWD} -mindepth 1 -maxdepth 1 -type f -iname "*.go" -exec basename {} \;)
      dirs=$(find ${PWD} -mindepth 1 -maxdepth 1 -type d -not -name ".*" -exec basename {} \;)
      repl="${files} ${dirs}"
      COMPREPLY=($(compgen -W "${repl}" -- ${cur}))
      ;;
  esac
  return 0
}

complete -F _go go

# }}}
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

export EDITOR=vim
# disable mac zsh warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# disable brew auto update
export HOMEBREW_NO_AUTO_UPDATE=true
export MONO_GAC_PREFIX="/usr/local"

# brew bottles repo
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export GOPROXY="https://goproxy.io"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GO111MODULE="on"
export GONOPROXY=\*\*.baidu.com\*\*
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# neofetch
export PATH="/usr/local/sbin:$PATH"
