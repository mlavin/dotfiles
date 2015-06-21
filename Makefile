all: terminal tmux git zsh vim

terminal:
	@gconftool --type string --set /apps/gnome-terminal/profiles/Default/custom_command "tmux -2"
	@gconftool --type bool --set /apps/gnome-terminal/profiles/Default/use_custom_command "true"

tmux:
	@cp tmux.conf $(HOME)/.tmux.conf

git:
	@cp gitconfig $(HOME)/.gitconfig
	@cp gitignore $(HOME)/.gitignore

zsh:
	@cp zshrc $(HOME)/.zshrc

vim: flake8 jshint
	@cp vimrc $(HOME)/.vimrc

flake8:
	@cp flake8 $(HOME)/.config/flake8

jshint:
	@cp jshintrc $(HOME)/.jshintrc

.PHONY: terminal tmux git zsh vim flake8 jshint
