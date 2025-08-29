vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- remove leftover highlights
vim.keymap.set("n", "Q", "<nop>") -- disable Q keybind 

-- movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move line up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move line down in visual mode

-- change window focus
vim.keymap.set("n", "<C-h>", "<C-w><C-h>") -- left
vim.keymap.set("n", "<C-j>", "<C-w><C-j>") -- down
vim.keymap.set("n", "<C-k>", "<C-w><C-k>") -- up
vim.keymap.set("n", "<C-l>", "<C-w><C-l>") -- right 

vim.keymap.set("n", "J", "mzJ`z") -- fix append line cursor behaviour

-- on half jump keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- on search keep cursor in the the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- note: sort and rebind later
vim.keymap.set("x", "<leader>p", [["_dP]]) -- preserve yanked text when pasting over something
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "copy into system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", { desc = "delete into the abyss" }) // note: changed keybind find out which key to use for this
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace inner word" })

-- temp keybinds
vim.keymap.set("n", "-", "<CMD>Oil<CR>")
