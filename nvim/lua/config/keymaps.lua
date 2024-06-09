-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- keymap: jk to Esc
vim.keymap.set("i", "jk", "<Esc>")

-- keymap: swap ; and :
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")
