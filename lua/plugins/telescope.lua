return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font
        }
    },
    config = function()
        pcall(require("telescope").load_extension, "fzf")

        local builtin = require("telescope.builtin")
        require("which-key").add({
            { -- which key group
                "<leader>f",
                icon = "",
                group = "telescope"
            },
            { -- files list in working directory 
                "<leader>ff",
                builtin.find_files,
                desc = "find files"
            },
            { -- search for a string in working directory
                "<leader>fg",
                builtin.live_grep,
                desc = "live grep"
            },
            { -- list open buffers in current neovim instance
                "<leader>fb",
                builtin.buffers,
                desc = "buffers"
            },
            { -- list available help tags
                "<leader>fh",
                builtin.help_tags,
                desc = "help tags"
            },
            { -- files in neovim configuration
                "<leader>fn",
                function()
                    builtin.find_files({
                        cwd = vim.fn.stdpath("config")
                    })
                end,
                desc = "neovim files"
            }
        })
    end
}
