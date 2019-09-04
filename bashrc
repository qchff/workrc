# alias {{{
alias ls='ls -F --show-control-chars --color=auto'
alias ll='ls -l'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias cctags='ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ && cscope -Rbqk'
# alias phptags='ctags -R --file-scope=yes --sort=yes --fields=+afikKlmnsSzt --languages=PHP --extra=+fq'
alias pytags='ctags -R --sort=1 --fields=+iaS --extra=+fq --languages=python && find . -name "*.py" > cscope.files && cscope -bqR && rm cscope.files'
alias phptags='ctags -R --sort=1 --fields=+iaS --extra=+fq --languages=php && find . -name "*.php" > cscope.files && cscope -bqR && rm cscope.files'
if hash zssh 2>/dev/null; then
    alias ssh='TERM=xterm zssh'
fi
if hash mvim 2>/dev/null; then
   alias vim='mvim -v'
fi
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


# }}}
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
export EDITOR=vim
