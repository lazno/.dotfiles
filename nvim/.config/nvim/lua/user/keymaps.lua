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
