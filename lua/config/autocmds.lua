-- highlihgt on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "highlight text on yank",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
