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

fonts: $(HOME)/.fonts/PowerlineSymbols.otf $(HOME)/.config/fontconfig/conf.d/10-powerline-symbols.conf
	fc-cache -vf ~/.fonts/

$(HOME)/.fonts/PowerlineSymbols.otf:
	mkdir -p $(HOME)/.fonts/
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O $@

$(HOME)/.config/fontconfig/conf.d/10-powerline-symbols.conf:
	mkdir -p $(HOME)/.config/fontconfig/conf.d/
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O $@

vim: flake8 jshint
	@cp vimrc $(HOME)/.vimrc

flake8:
	@cp flake8 $(HOME)/.config/flake8

jshint:
	@cp jshintrc $(HOME)/.jshintrc

.PHONY: terminal tmux git zsh vim flake8 jshint
