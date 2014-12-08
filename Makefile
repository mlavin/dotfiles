all: terminal tmux git

terminal:
	@gconftool --type string --set /apps/gnome-terminal/profiles/Default/custom_command "tmux"
	@gconftool --type bool --set /apps/gnome-terminal/profiles/Default/use_custom_command "true"

tmux:
	@cp tmux.conf $(HOME)/.tmux.conf

git:
	@cp gitconfig $(HOME)/.gitconfig
	@cp gitignore $(HOME)/.gitignore

.PHONY: terminal tmux git
