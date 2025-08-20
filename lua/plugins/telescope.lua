return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
        pcall(require("telescope").load_extension, "fzf")

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

        -- shortcut for searching nvim configuration files
        vim.keymap.set("n", "<leader>fn", function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
        end, { desc = "[S]earch [N]eovim files" })
    end
}
