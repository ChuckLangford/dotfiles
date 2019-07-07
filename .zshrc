export PATH=$PATH:/usr/local/sbin:~/go/bin
export VISUAL=nvim
export EDITOR=$VISUAL
export FZF_DEFAULT_COMMAND='ag -l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVM_DIR="$HOME/.nvm"
export ZSH=~/.oh-my-zsh

fpath=(
    ~/Documents/src/toolbelt/zshfunctions
    ~/Documents/src/toolbelt/zshfunctions/cheatsheets
    "${fpath[@]}"
    )
autoload -Uz cs

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
cd ~/Documents/src

nvm_load () {
  . $NVM_DIR/nvm.sh
  . $NVM_DIR/bash_completion
}
alias mit-scheme="/Applications/MIT-Scheme.app/Contents/Resources/mit-scheme"
alias node='unalias nvm; unalias node; unalias npm; nvm_load; node $@'
alias npm='unalias nvm; unalias node; unalias npm; nvm_load; npm $@'
alias nvm='unalias nvm; unalias node; unalias npm; nvm_load; nvm $@'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/clangford/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/clangford/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/clangford/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/clangford/Documents/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
