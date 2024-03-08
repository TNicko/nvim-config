vim.g.mapleader = " "
local keymap = vim.keymap

-- switch insert/visual to normal mode
keymap.set("i", "kj", "<ESC>")
keymap.set("v", "kj", "<ESC>")

-- no copy when deleting char
keymap.set("n", "x", '"_x')

-- search terms in middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")


-- move highlighted lines
keymap.set("v", "I", ":m '<-2<CR>gv=gv")
keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- replace all instances of current word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

----------------------
-- custom keymaps
----------------------

-- open prev file
keymap.set("n", "<Esc>G]", "<C-^>")

-- save and quit
keymap.set("n", "<Esc>]H", ":wq<CR>")
keymap.set("i", "<Esc>]H", "<C-o>:wq<CR>")

-- save only
keymap.set("n", "<Esc>C]", ":w<CR>")
keymap.set("i", "<Esc>C]", "<C-o>:w<CR>")

-- move down multiple lines at a time
keymap.set("n", "<M-Up>", "<C-u>zz")
keymap.set("n", "<M-Down>", "<C-d>zz")

-- move to end of line
keymap.set("i", "<Esc>]C", "<End>")
keymap.set("n", "<Esc>]C", "<End>")
keymap.set("v", "<Esc>]C", "<End>")

-- move to beginning of line
keymap.set("i", "<Esc>]A", "<C-o>_")
keymap.set("n", "<Esc>]A", "_")
keymap.set("v", "<Esc>]A", "_")

-- redo
keymap.set("n", "<Esc>D]", "<C-r>")
keymap.set("i", "<Esc>D]", "<C-o><C-r>")

-- move to next/previous word
keymap.set("n", "<M-Right>", "<S-Right>")
keymap.set("n", "<M-Left>", "<S-Left>")
keymap.set("i", "<M-Right>", "<S-Right>")
keymap.set("i", "<M-Left>", "<S-Left>")
keymap.set("v", "<M-Right>", "<S-Right>")
keymap.set("v", "<M-Left>", "<S-Left>")

-- move to top of file
keymap.set("i", "<Esc>]D", "<C-Home>")
keymap.set("n", "<Esc>]D", "<C-Home>")
keymap.set("v", "<Esc>]D", "<C-Home>")

-- move to bottom of file
keymap.set("i", "<Esc>]E", "<C-o>G")
keymap.set("n", "<Esc>]E", "G")
keymap.set("v", "<Esc>]E", "G")

-- move between tabs
keymap.set("n", "<S-right>", "<C-w>l")
keymap.set("n", "<S-left>", "<C-w>h")
keymap.set("n", "<S-up>", "<C-w>k")
keymap.set("n", "<S-down>", "<C-w>j")

----------------------
-- plugin keymaps
----------------------

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- comment line
keymap.set("v", "<Esc>F]", "<plug>NERDCommenterToggle")
keymap.set("n", "<Esc>F]", "<plug>NERDCommenterToggle")

-- telescope
-------------
-- find files
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
-- find git files
keymap.set("n", "<leader>pf", "<cmd>Telescope git_files<cr>")
-- find text
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
-- find current string cursor is on
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
-- show current buffers
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
-- show help tags
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
