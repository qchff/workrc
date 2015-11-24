alias ll='ls -l'
alias sz='sz -bey'
alias rz='rz -bey'

export PATH=$PATH:~/Applications/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1='\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 5)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]mac \[$(tput setaf 5)\]\W$(__git_ps1 " (%s)")\[$(tput setaf 4)\]]\\$ \[$(tput sgr0)\]'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

function title {
    echo -ne "\033]0;"$*"\007"
}

# bdssh complete {{{
_completebdssh() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    if [[ ${COMP_CWORD} == 1 ]] ; then
        local wordlist=$(cat ~/Applications/bin/hosts_online.txt ~/Applications/bin/hosts_dev.txt)
    fi
    if [[ ${COMP_CWORD} == 2 ]] ; then
        local wordlist="MhxzKhl qwerUIOP123"
    fi
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completebdssh bdssh
# }}}
