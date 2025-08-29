return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local lualine = require("lualine")
        local trouble = require("trouble")

        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
        })

        local opts = {
            sections = {
                lualine_c = {
                    {
                        symbols.get,
                        cond = symbols.has
                    }
                }
            }
        }

        lualine.setup(opts)
    end
}
