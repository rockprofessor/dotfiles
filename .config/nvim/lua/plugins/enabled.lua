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
}
