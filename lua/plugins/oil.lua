return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        default_file_explorer = true,
    },
    dependencies = {
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    lazy = false,
}
