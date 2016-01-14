# General
set HOMEBREW "/usr/local"
set EDITOR neovim
set fish_greeting ""

# Env
set PATH $HOME/.dotfiles/bin /usr/local/cuda/bin /opt/torch/install/bin $PATH
set -g -x LD_LIBRARY_PATH /opt/torch/install/lib:/usr/local/cuda/lib:$LD_LIBRARY_PATH
set -g -x DYLD_LIBRARY_PATH /opt/torch/install/lib:/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
set -g -x DYLD_FALLBACK_LIBRARY_PATH /usr/local/cuda/lib:/Developer/NVIDIA/CUDA-7.5/lib
set -g -x CXXFLAGS "-I$HOMEBREW/include"
set -g -x LDFLAGS "-L$HOMEBREW/lib"
set -g -x PAGER vimpager

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

# torch
set -g LUA_PATH '/Users/alex/.luarocks/share/lua/5.1/?.lua;/Users/alex/.luarocks/share/lua/5.1/?/init.lua;/opt/torch/install/share/lua/5.1/?.lua;/opt/torch/install/share/lua/5.1/?/init.lua;./?.lua;/opt/torch/install/share/luajit-2.1.0-beta1/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua'
set -g LUA_CPATH '/Users/alex/.luarocks/lib/lua/5.1/?.so;/opt/torch/install/lib/lua/5.1/?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so'
set -g LUA_CPATH '/opt/torch/install/lib/?.dylib;'$LUA_CPATH
