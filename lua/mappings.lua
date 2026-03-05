if vim.g.vscode then
else
    require "nvchad.mappings"
end

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map({ "n", "v" }, "d", '"_d', { noremap = true, silent = true })
map({ "n", "v" }, "D", '"_D', { noremap = true, silent = true })
map("n", "dd", '"_dd', { noremap = true, silent = true })

map({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
map({ "n", "v" }, "X", '"_X', { noremap = true, silent = true })
