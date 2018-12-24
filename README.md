dotfiles
========
This is an extremely Mac specific setup.

New Setup
========
* Install [homebrew](https://brew.sh/).
* Install [iterm2](https://www.iterm2.com/).
* Install iterm2 [colorschemes](https://github.com/mbadolato/iTerm2-Color-Schemes) and use the Solarized dark theme.
* Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* Install tmux (brew install tmux).
* Install [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) fonts.
* Install [nvm](https://github.com/creationix/nvm).
* Install [eslint](https://www.npmjs.com/package/eslint-config-airbnb).
* Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher).
* Install [fzf](https://github.com/junegunn/fzf).
* Install [neovim](https://github.com/neovim/neovim).
* Install [vim-plug](https://github.com/junegunn/vim-plug).

Use this config:
```
git clone https://github.com/ChuckLangford/dotfiles.git ~/.vim
```

Create symbolic links:
```
  ln -s ~/.vim/.vimrc ~/.vimrc
  ln -s ~/.vim/.zshrc ~/.zshrc
  ln -s ~/.vim/.tmux.conf ~/.tmux.conf
  ln -s ~/.vim/.eslintrc ~/.eslintrc
```

NOTE: Need to setup the nvim files

# This section may be out of date. Needs testing.
macOS Sierra currently causes issues with vim/tmux copy/paste. Do the following to adjust:
```
  brew install reattach-to-user-namespace
```
