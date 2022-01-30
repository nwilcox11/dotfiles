# Fish git prompt
set fish_greeting ""
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'

set -g fish_prompt_pwd_dir_length 3
set -gx TERM xterm-256color

# clangd lsp
fish_add_path /usr/local/opt/llvm/bin
# gopls lsp
fish_add_path $HOME/go/bin

set -g GOPATH $HOME/go
set -gx PGDATA /usr/local/var/postgres/data
set -gx EDITOR nvim

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
