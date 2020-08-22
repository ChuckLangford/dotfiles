# Make sure oh-my-zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo "Installed ~/.oh-my-zsh"
else
	echo "~/.oh-my-zsh already exists"
fi

# Install vim-plug
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "Installed ~/.vim/autoload/plug.vim"
else
	echo "~/.vim/autoload/plug.vim file already exists"
fi

# Install vimrc
if [ ! -f "$HOME/.vim/.vimrc" ]; then
	curl -fsSLo ~/.vim/.vimrc https://raw.githubusercontent.com/ChuckLangford/dotfiles/main/.vimrc
	echo "Installed ~/.vim/.vimrc"
else
	echo "~/.vim/.vimrc file already exists"
fi

# Install zshrc
if [ ! -f "$HOME/.vim/.zshrc" ]; then
	if [ ! -L "$HOME/.zshrc" ]; then
		curl -fsSLo ~/.vim/.zshrc https://raw.githubusercontent.com/ChuckLangford/dotfiles/main/.zshrc
		echo "Installed ~/.vim/.zshrc"
	else
		echo "~/.zshrc symbolic link already existed but ~/.vim/.zshrc was not found"
	fi
else
	echo "~/.vim/.zshrc file already exists"
fi

# Install gitignore
if [ ! -f "$HOME/.vim/.gitignore" ]; then
	if [ ! -L "$HOME/.gitignore" ]; then
		curl -fsSLo ~/.vim/.gitignore https://raw.githubusercontent.com/ChuckLangford/dotfiles/main/.gitignore
		echo "Installed ~/.vim/.gitignore"
	else
		echo "~/.gitignore symbolic link already existed but ~/.vim/.gitignore was not found"
	fi
else
	echo "~/.vim/.gitignore file already exists"
fi

# Install tmux.conf
if [ ! -f "$HOME/.vim/.tmux.conf" ]; then
	if [ ! -L "$HOME/.tmux.conf" ]; then
		curl -fsSLo ~/.vim/.tmux.conf https://raw.githubusercontent.com/ChuckLangford/dotfiles/main/.tmux.conf
		echo "Installed ~/.vim/.tmux.conf"
	else
		echo "~/.tmux.conf symbolic link already existed but ~/.vim/.tmux.conf was not found"
	fi
else
	echo "~/.vim/.tmux.conf file already exists"
fi

# Link stuff
if [ ! -L "$HOME/.vimrc" ]; then
	ln -s ~/.vim/.vimrc ~/.vimrc
	echo "Created ~/.vimrc symbolic link"
else
	echo "~/.vimrc symbolic link already exists"
fi

if [ ! -L "$HOME/.zshrc" ]; then
	if [ -f "$HOME/.zshrc" ]; then
		echo "Backing up existing ~/.zshrc to ~/.zshrc.backup"
		mv $HOME/.zshrc $HOME/.zshrc.back
	fi
	ln -s ~/.vim/.zshrc ~/.zshrc
	echo "Created ~/.zshrc symbolic link"
else
	echo "~/.zshrc symbolic link already exists"
fi

if [ ! -L "$HOME/.gitignore" ]; then
	if [ -f "$HOME/.gitignore" ]; then
		echo "Backing up existing ~/.gitignore to ~/.gitignore.backup"
		mv $HOME/.gitignore $HOME/.gitignore.backup
	fi
	ln -s ~/.vim/.gitignore ~/.gitignore
	echo "Created ~/.gitignore symbolic link"
else
	echo "~/.gitignore symbolic link already exists"
fi

if [ ! -L "$HOME/.tmux.conf" ]; then
	if [ -f "$HOME/.tmux.conf" ]; then
		echo "Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup"
		mv $HOME/.tmux.conf $HOME/.tmux.conf.backup
	fi
	ln -s ~/.vim/.tmux.conf ~/.tmux.conf
	echo "Created ~/.tmux.conf symbolic link"
else
	echo "~/.tmux.conf symbolic link already exists"
fi
