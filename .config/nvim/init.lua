-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Remap to use leader key for switching windows
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>h", { desc = "jump to left window", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>l", { desc = "jump to right window", noremap = true, silent = true })

-- Use wl-copy and wl-paste for clipboard operations
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste",
    ["*"] = "wl-paste",
  },
  cache_enabled = 0,
}
-- Delete without Clipboard
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true, silent = true })

-- Aktiviert die Rechtschreibprüfung nur für LaTeX-Dateien
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt.spell = true -- Rechtschreibprüfung aktivieren
    vim.opt.spelllang = "de" -- Sprache auf Deutsch setzen
  end,
})

vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- disable providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- setup vim terminator for running python
vim.g.terminator_split_raction = 0.45
vim.g.terminator_split_location = "vertical botright"

-- Map <leader>lc to compile LaTeX document
vim.api.nvim_set_keymap("n", "<leader>lc", ":VimtexCompile<CR>", { noremap = true, silent = true })

-- Map <leader>lv to view the PDF
vim.api.nvim_set_keymap("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })

-- set okular as pdf viewer for vimtex
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

-- line length for tex files
vim.api.nvim_create_augroup("TexFileSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt_local.textwidth = 80 -- Change 80 to your desired line length
    vim.opt_local.wrap = true -- Enable line wrapping (optional)
  end,
})
