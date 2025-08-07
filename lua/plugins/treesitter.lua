return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "query",
        "markdown",
        "markdown_inline"
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
