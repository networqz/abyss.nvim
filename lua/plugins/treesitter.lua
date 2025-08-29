return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "cpp", "html", "css", "javascript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            ignore_install = {},
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enabled = true
            }
        })
    end
}
