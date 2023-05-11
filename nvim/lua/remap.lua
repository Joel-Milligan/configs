vim.g.mapleader = " " -- Set the leader key to space
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Quick way to go back to netrw

-- Telescope remaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Find all files from current directory
