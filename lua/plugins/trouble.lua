return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    config = function()
        require("which-key").add({
            { -- which key group
                "<leader>d",
                group = "trouble",
            },
            { -- toggle diagnostics
                "<leader>dd",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "diagnostics"
            },
            { -- toggle diagnostics for current buffer 
                "<leader>db",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "buffer diagnostics"
            },
            { -- maybe not needed because added it to lualine
                "<leader>ds",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "symbols"
            },
            { -- toggle lsp definitions and references
                "<leader>dl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "definitions / references"
            },
            { -- toggle location list
                "<leader>dL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "location list"
            },
            { -- toggle quick fix list
                "<leader>dQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "quickfix list"
            }
        })
    end
}
