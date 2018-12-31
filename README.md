# My MacOS Setup

## [brew](https://brew.sh/)

### Installation:
```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## [Git & Github](https://git-scm.com/)

1. Install git If git is not installed on your system.
2. [Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

	```sh
	# 1. Paste the text below, substituting in your GitHub email address.
	ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
	
	# 2. Adding your SSH key to the ssh-agent
	# 2.1 Start the ssh-agent in the background.
	eval "$(ssh-agent -s)"
	# 2.2 Add your SSH private key to the ssh-agent and store your passphrase in the keychain. 	
	ssh-add -K ~/.ssh/id_rsa
	```

3. Add the SSH key to your GitHub account.
	- Login into [Github](https://github.com/)
	- Settings -> SSH keys & GPG keys
		- click on `new key`
		- `pbcopy < ~/.ssh/id_rsa.pub`
		- `command + v` to past the id_rsa.pub and save

### Utilities

- [tig](https://github.com/jonas/tig)

	```sh 
	brew install tig
	```

- [git-extras ](https://github.com/tj/git-extras)

	```sh 
	brew install git-extras
	```
- [Sourcetree](https://www.sourcetreeapp.com/)

- Color picker: [colorPicker](http://www.northernspysoftware.com/software/colorpicker) + [Skala Color](https://bjango.com/mac/skalacolor/)

## Shell
### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
#### oh-my-zsh plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

	1. Clone this repository into $ZSH_CUSTOM/plugins (by default ~/.oh-my-zsh/custom/plugins)

		```sh
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		```
	2. Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):

		```sh
		plugins=(zsh-autosuggestions)
		```

### Utilities

- [fzf](https://github.com/junegunn/fzf)
- tree

### Configuration:

- Preferences -> Rendering: 
	- [√] Syntax highlighted code block
	- Choose a theme
- Preferences -> Terminal:
	- Install shell utility, so that we can use macdown to open file from terminal


## [node](https://nodejs.org/en/)

### [nvm](https://github.com/creationix/nvm)

```sh
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
```

### [tnpm]()

```sh
# install tnpm

npm install -g tnpm --registry=http://registry.npm.alibaba-inc.com 

# or , npminstall: Make `npm install` fast and easy.
npm i -g npminstall --registry=http://registry.npm.alibaba-inc.com
npminstall -g tnpm --registry=http://registry.npm.alibaba-inc.com

```

## [Emacs](https://www.gnu.org/software/emacs/download.html)

## Installation:

- [brew or MacPorts](https://www.gnu.org/software/emacs/download.html)
- [universal binaries](https://emacsformacosx.com/)

## vim

### Package Manager
[plug](https://github.com/junegunn/vim-plug)

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## [mpv](https://mpv.io/)
A free, open source, and cross-platform media player.

## [vscode](https://code.visualstudio.com/)

### User Configration
```sh
$HOME/Library/Application\ Support/Code
```

### Install `code` command in path

command+shift+p & type: shell Command

## Links

```sh
# .zshrc & .zshenv
ln -s $HOME/dots/{.zshrc,.zshenv} $HOME/

# .inputrc
ln -s $HOME/dots/.inputrc $HOME

# vim
ln -s $HOME/dots/{.vimrc,.vimrc.local,.vimrc.bundles.local} $HOME/
# open vim & run :PlugInstall

# vscode
ln -s $HOME/dots/vscode $HOME/Library/Application\ Support/Code/User

# oh-my-zsh theme
ln -s $HOME/dots/vimniky.zsh-theme $HOME/.oh-my-zsh/themes/

# .gitconfig & .gitignore
ln -s $HOME/dots/{.gitconfig,.gitignore} $HOME/

# link all
ln -s $HOME/dots/{.zshrc,.zshenv,.inputrc,.vim,.vimrc,.vimrc.local,.vimrc.bundles.local,vimniky.zsh-theme,s.gitconfig,.gitignore} $HOME/
```
