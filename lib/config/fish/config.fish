# General
set PATH $HOME/.dotfiles/bin $PATH
set EDITOR vim
set fish_greeting ""

# Colors
set fish_color_normal normal
set fish_color_command blue
set fish_color_quote green
set fish_color_redirection yellow
set fish_color_end cyan
set fish_color_error red
set fish_color_param normal
set fish_color_comment black --bold
set fish_color_match yellow
set fish_color_search_match red --bright
set fish_color_operator cyan
set fish_color_escape green
set fish_color_cwd normal

# rbenv
if which rbenv
	set PATH $HOME/.rbenv/bin $PATH
	set PATH $HOME/.rbenv/shims $PATH
	rbenv rehash >/dev/null ^&1
end
