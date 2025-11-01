-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Make sure this file is required from your init.lua or main LazyVim config

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    group = vim.api.nvim_create_augroup("MarkdownIndentFix", { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "typst",
    group = vim.api.nvim_create_augroup("MarkdownIndentFix", { clear = true }),
    callback = function()
        vim.schedule(function()
            vim.bo.tabstop = 4
            vim.bo.shiftwidth = 4
            vim.bo.softtabstop = 4
            vim.bo.expandtab = true
        end)
    end,
})
