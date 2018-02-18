dotfiles
========
This is an extremely Mac specific setup. Additionally, the vim configuration requires vim 8+ or nvim. It has been tested and works with both.

New Setup
========
Install homebrew.
Install iterm2.
Install iterm2 [colorschemes](https://github.com/mbadolato/iTerm2-Color-Schemes) and use the Solarized dark theme.
Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
Install tmux (using homebrew).
Install [Source Code Pro](https://github.com/adobe-fonts/source-code-pro) fonts.
Install [nvm](https://github.com/creationix/nvm).
Install [eslint](https://www.npmjs.com/package/eslint-config-airbnb).
Install [The Silver Searcher](https://github.com/ggreer/the_silver_searcher).
Install [fzf](https://github.com/junegunn/fzf).
Install [neovim](https://github.com/neovim/neovim).
Install [vim-plug](https://github.com/junegunn/vim-plug).

Install Vim
The default installation of Vim doesn't have some necessary options built in. Override that by using Homebrew.
```
brew info vim // use this to see which options are available
```

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
