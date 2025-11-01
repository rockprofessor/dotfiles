return {
    -- load vim-terminator for running python code
    { "erietz/vim-terminator" },
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
    },
    {
        "szymonwilczek/vim-be-better",
        config = function()
            -- Optional: Enable logging for debugging
            vim.g.vim_be_better_log_file = 1
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
        end,
    },
    {
        "junegunn/fzf",
        build = "./install --bin", -- or just ":!./install" if you're lazy
    },
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf" },
    },
    {
        "mzlogin/vim-markdown-toc",
        ft = "markdown",
    },
    {
        "ThePrimeagen/vim-be-good",
    },
    {
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },
}
