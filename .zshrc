export ZSH="$HOME/.oh-my-zsh"
export VISUAL=vim
export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag -l'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
