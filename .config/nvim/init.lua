-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Remap to use leader key for switching windows
vim.api.nvim_set_keymap("n", "<leader>j", "<C-w>h", { desc = "jump to left window", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<C-w>l", { desc = "jump to right window", noremap = true, silent = true })

-- Setup Tabstops
vim.opt.tabstop = 4 -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.expandtab = true -- Convert tabs to spaces

-- Set text width to 80 characters
vim.opt.textwidth = 80
-- Automatically wrap lines at 80 characters while typing
vim.opt.formatoptions:append("t")

-- Aktiviert die Rechtschreibprüfung nur für LaTeX-Dateien
vim.api.nvim_create_augroup("TexFileSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.opt.spell = true -- Rechtschreibprüfung aktivieren
        vim.opt.spelllang = { "de", "en" } -- Sprache auf Deutsch setzen
        vim.opt_local.textwidth = 80 -- Change 80 to your desired line length
        vim.opt_local.wrap = true -- Enable line wrapping (optional)
    end,
})

-- Markdown Preview
vim.g.mkdp_preview_options = {
    katex = 1,
}

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

-- setup vimtex
vim.g.vimtex_compiler_latexmk = {
    options = {
        "-pdf",
        "-shell-escape",
        "-synctex=1",
        "-interaction=nonstopmode",
    },
}

-- Typst setup
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.typ",
    command = "setlocal spell spelllang=de",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.md",
    command = "setlocal spell spelllang=de",
})

-- set okular as pdf viewer for vimtex
vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
-- LaTeX setup end

package.path = package.path .. ";/usr/lib/luarocks/rocks-5.4/?.lua"
