# alias {{{
alias ls='ls -F --show-control-chars --color=auto'
alias ll='ls -l'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias sz='sz -bey'
alias rz='rz -bey'
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

PS1='\[$(tput bold)\]\[$(tput setaf 4)\][\033[38;5;26m\]\u\[$(tput setaf 4)\]@\[\033[38;5;26m\]mac \[\033[38;5;124m\]\A \[\033[38;5;26m\]\W\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]'

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
# }}}
