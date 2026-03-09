-- lua/plugins/typst_preview.lua
return {
    {
        "chomosuke/typst-preview.nvim",
        -- You can lazy-load on typst filetype, or just load always:
        ft = { "typst" },
        version = "1.*",
        build = function()
            -- download the required binaries (tinymist, websocat)
            require("typst-preview").update()
        end,
        opts = {
            -- example options; you can customise as needed
            debug = false,
            open_cmd = nil, -- use default browser
            port = 0, -- random port
            invert_colors = "never", -- or "auto", or a table
            follow_cursor = true,
            dependencies_bin = {
                tinymist = "tinymist", -- if you installed tinymist via Mason or system
                websocat = nil, -- let plugin download it
            },
            extra_args = nil, -- e.g. { "--input=ver=draft" }
            get_root = function(path)
                -- override project root detection if needed
                return vim.fn.fnamemodify(path, ":p:h")
            end,
            get_main_file = function(buf_path)
                -- determine main typst file; here we treat current file as main
                return buf_path
            end,
        },
        config = function(_, opts)
            require("typst-preview").setup(opts)
        end,
    },
}
