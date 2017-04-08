dotfiles
========

New Setup
========
Install iterm2. Make sure to set the iterm colors preference to at least slightly above low contrast. The Solarized color scheme has issues when running in the terminal and vim at the same time.
Install oh-my-zsh, homebrew, tmux (using homebrew).
Install the Powerline fonts from here: https://github.com/powerline/fonts. Set iterm2 to use 12pt DejaVu Sans Mono for Powerline.
Install nvm using: https://github.com/lukechilds/zsh-nvm
Install eslint and any needed linting rules (airbnb, react-app, etc)

Setup Vim
```
  git clone [this repo] ~/.vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
```

Create symbolic links:
```
  ln -s ~/.vim/.vimrc ~/.vimrc
  ln -s ~/.vim/.zshrc ~/.zshrc
  ln -s ~/.vim/.tmux.conf ~/.tmux.conf
  ln -s ~/.vim/.eslintrc ~/.eslintrc
```

ESLint: use the instructions for Airbnb here https://www.npmjs.com/package/eslint-config-airbnb
