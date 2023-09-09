vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-------------------------------------
-- hello general keymaps
-------------------------------------

-- switch insert to normal mode
keymap.set("i", "kj", "<ESC>")
keymap.set("v", "kj", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights

keymap.set("n", "x", '"_x') -- doesnt copy when deleting char

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split vertical
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontal
keymap.set("n", "<leader>se", "<C-w>=") -- split equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split

-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tp", ":tabp<CR>")

-- move highlighted lines
keymap.set("v", "I", ":m '<-2<CR>gv=gv")
keymap.set("v", "K", ":m '>+1<CR>gv=gv")

-- search terms in middle
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- highlight copy paste remap
keymap.set("x", "<leader>p", '"_dP')

-- replace all instances of current word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- bash instant executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-------------------------------------
-- custom mac keymaps
-------------------------------------

-- open prev file
keymap.set("n", "<Esc>G]", "<C-^>")

-- indenting
keymap.set("n", "<Esc>H]", ">>")
keymap.set("v", "<Esc>H]", "<S->>")
keymap.set("n", "<Esc>I]", "<<")
keymap.set("v", "<Esc>I]", "<S-<>")

-- save and quit
keymap.set("n", "<Esc>]H", ":wq<CR>")
keymap.set("i", "<Esc>]H", "<C-o>:wq<CR>")

-- save only
keymap.set("n", "<Esc>C]", ":w<CR>")
keymap.set("i", "<Esc>C]", "<C-o>:w<CR>")

-- copy
keymap.set("n", "<Esc>]G", "yy")
keymap.set("i", "<Esc>]G", "<C-o>yy")
keymap.set("v", "<Esc>]G", "y")

-- deletes
keymap.set("n", "<Esc>]I", '0"_D')
keymap.set("i", "<Esc>]I", '<C-o>0<C-o>"_D')
keymap.set("v", "<Esc>]I", '"_D')

keymap.set("n", "<M-Backspace>", "daw")
keymap.set("i", "<M-Backspace>", "<C-o>daw")

-- move to next/previous word
keymap.set("n", "<M-Right>", "<S-Right>")
keymap.set("n", "<M-Left>", "<S-Left>")
keymap.set("i", "<M-Right>", "<S-Right>")
keymap.set("i", "<M-Left>", "<S-Left>")
keymap.set("v", "<M-Right>", "<S-Right>")
keymap.set("v", "<M-Left>", "<S-Left>")

-- move between tabs
keymap.set("n", "<S-right>", "<C-w>l")
keymap.set("n", "<S-left>", "<C-w>h")
keymap.set("n", "<S-up>", "<C-w>k")
keymap.set("n", "<S-down>", "<C-w>j")

-- move down multiple lines at a time
keymap.set("n", "<M-Up>", "<C-u>zz")
keymap.set("n", "<M-Down>", "<C-d>zz")

-- move to end of line
keymap.set("i", "<Esc>]C", "<End>")
keymap.set("n", "<Esc>]C", "<End>")
keymap.set("v", "<Esc>]C", "<End>")

-- move to beginning of line
keymap.set("i", "<Esc>]A", "<C-o>0")
keymap.set("n", "<Esc>]A", "0")
keymap.set("v", "<Esc>]A", "0")

-- move to top of file
keymap.set("i", "<Esc>]D", "<C-Home>")
keymap.set("n", "<Esc>]D", "<C-Home>")
keymap.set("v", "<Esc>]D", "<C-Home>")

-- move to bottom of file
keymap.set("i", "<Esc>]E", "<C-o>G")
keymap.set("n", "<Esc>]E", "G")
keymap.set("v", "<Esc>]E", "G")

-- undo
keymap.set("n", "<Esc>]F", "u")
keymap.set("i", "<Esc>]F", "<C-o>u")

-- redo
keymap.set("n", "<Esc>D]", "<C-r>")
keymap.set("i", "<Esc>D]", "<C-o><C-r>")

-- find
keymap.set("n", "<Esc>E]", "/")

-- comment line
keymap.set("v", "<Esc>F]", "<plug>NERDCommenterToggle")
keymap.set("n", "<Esc>F]", "<plug>NERDCommenterToggle")

-------------------------------------
-- plugin keymaps
-------------------------------------

-- fugitive (git)
keymap.set("n", "<leader>gs", vim.cmd.Git)

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- undo-tree
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

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
