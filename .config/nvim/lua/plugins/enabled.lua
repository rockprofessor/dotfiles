return {
    -- load vim-terminator for running python code
    { "erietz/vim-terminator" },
    {
        "kaarmu/typst.vim",
        ft = "typst",
        lazy = false,
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
        "nvzone/typr",
        dependencies = "nvzone/volt",
        opts = {},
        cmd = { "Typr", "TyprStats" },
    },

    -- ~/.config/nvim/lua/plugins/colorizer.lua
    {
        "norcalli/nvim-colorizer.lua",
        -- You can lazy-load it if you like, for example:
        event = "BufReadPost",
        config = function()
            require("colorizer").setup({
                -- list of filetypes or `*` for all
                "*",
            }, {
                -- default options (you can customize)
                RGB = true,
                RRGGBB = true,
                names = true,
                RRGGBBAA = false,
                css = false,
                mode = "background", -- or "foreground"
            })
        end,
    },
}
