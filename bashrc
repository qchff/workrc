# ls配色
eval `gdircolors .dircolors`

alias ls='gls --color=auto'
alias ll='ls -l'
alias rm='grm'
alias du='gdu'
alias vpn_tunnel='ssh -D 8888 qucaihui@qch.me'

export PATH=$PATH:~/local/bin

# bash completition {{{
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
# }}}

# mark {{{
export MARKPATH=$HOME/.marks
function j {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}
function marks {
    ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

_completemarks() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    local wordlist=$(find $MARKPATH -type l -printf "%f\n")
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completemarks j unmark
# }}}

# bdssh complete {{{
_completebdssh() {
    local curw=${COMP_WORDS[COMP_CWORD]}
    if [[ ${COMP_CWORD} == 1 ]] ; then
        local wordlist=$(cat ~/local/bin/hosts_online.txt ~/local/bin/hosts_dev.txt)
    fi
    if [[ ${COMP_CWORD} == 2 ]] ; then
        local wordlist=""
    fi
    COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
    return 0
}
complete -F _completebdssh bdssh
# }}}
