local opts = {noremap = true, silent = false}

local keymap = vim.keymap.set

-- jump between split windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- map leader key to space bar
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- easy way to exit to normal mode
keymap("i", "jk", "<ESC>", opts)

-- File explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) 

-- indentation in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
 
-- move text up and down
keymap("v", "J", ":m'>+<CR>gv=gv", opts)
keymap("v", "K", ":m-2<CR>gv=gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- disable highlighting for current search
keymap("n", "<c-/>", ":noh<CR>", opts)
keymap("n", "gD",
function()
  vim.lsp.buf.definition()
end)

-- dont copy to clipboard when deleting
keymap("n", "x", "\"_x", opts)
keymap("n", "d", "\"_d", opts)
keymap("v", "d", "\"_d", opts)
keymap("v", "x", "\"_x", opts)

-- adjust yanking cursor behaviour
keymap("n", "<A-J>", "\"yyy\"yp")
-- keymap("x", "<leader><S-j>", "\"yy`>\"ygpk")
keymap("x", "<A-J>", "\"yy`>\"ygp0`[<S-v>`]")
keymap("v", "y", "y`>")
