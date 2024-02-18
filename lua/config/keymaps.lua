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

-- redo
keymap.set("n", "<Esc>C]", ":w<CR>")
keymap.set("i", "<Esc>C]", "<C-o>:w<CR>")

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
