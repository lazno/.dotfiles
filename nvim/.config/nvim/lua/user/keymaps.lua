local opts = {noremap = true, silent = true}

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
keymap("i", "jk", "<ESC>", opts)
