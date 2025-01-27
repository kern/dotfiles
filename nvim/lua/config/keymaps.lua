-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- keymap: jk to Esc
vim.keymap.set("i", "jk", "<Esc>")

-- keymap: swap ; and :
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-- keymap: vim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>", { silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>", { silent = true })

-- keymap: %% to current file directory
vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<CR>")

-- keymap: leader-S to sort the selected lines.
vim.keymap.set("v", "<leader>S", ":sort<CR>")

-- keymap: leader-O to open the current directory in a Finder window
vim.keymap.set("n", "<leader>o", ":exe '!open '.expand('%:h').'/'<CR>")

-- keymap: <leader><leader> to toggle Neotree
vim.keymap.set("n", "<leader><leader>", ":Neotree<CR>")
