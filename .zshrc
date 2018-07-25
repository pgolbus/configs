autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
compdef _path_files cd

zstyle ':completion:*' completer _complete _ignored _files

# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'

# Set the prompt.
PROMPT=$'[%m]$(prompt_git_info)%~%# '

## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt hist_expire_dups_first

export EDITOR=emacs

bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

alias clr='clear'
alias pepall='find -iname "*.py" | xargs pep8'
alias gno='git status -uno'

alias datasci='ssh datasci12.dev.bo1.csnzoo.com'
alias devtops='ssh bigdatatop01.dev.bo1.csnzoo.com'
