export PATH=$PATH:/usr/local/sbin:~/go/bin
export VISUAL=nvim
export EDITOR=$VISUAL
export FZF_DEFAULT_COMMAND='ag -l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NVM_DIR="$HOME/.nvm"
export ZSH=~/.oh-my-zsh

# fpath=( ~/Documents/src/toolbelt/zshfunctions/cheatsheets "${fpath[@]}" )
fpath=(
    ~/Documents/src/toolbelt/zshfunctions
    ~/Documents/src/toolbelt/zshfunctions/cheatsheets
    "${fpath[@]}"
    )
autoload -Uz cs

ZSH_THEME="robbyrussell"

plugins=(git)
plugins+=(zsh-nvm)

source $ZSH/oh-my-zsh.sh
cd ~/Documents/src
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/clangford/Documents/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/clangford/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/clangford/Documents/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/clangford/Documents/google-cloud-sdk/completion.zsh.inc'; fi
