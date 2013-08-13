set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_color_dirtystate red
set __fish_git_prompt_color_stagedstate green

function fish_prompt --description 'Write out the prompt'
	printf '%s%s ' (prompt_pwd) (__fish_git_prompt)
	set_color cyan
	printf '$ '
	set_color normal
end
