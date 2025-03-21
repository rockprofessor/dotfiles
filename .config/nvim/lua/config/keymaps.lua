-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map <leader>t to :TypstWatch
vim.keymap.set("n", "<leader>t", ":TypstWatch<CR>", { noremap = true, silent = true })
