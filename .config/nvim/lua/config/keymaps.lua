-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map <leader>t to :TypstWatch
-- vim.keymap.set("n", "<leader>t", ":TypstWatch<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", ":TypstPreviewToggle<CR>", { desc = "Toggle Typst Preview" })
vim.keymap.set("n", "<leader>ts", ":TypstPreviewStop<CR>", { desc = "Stop Typst Preview" })
