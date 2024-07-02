vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>ee", vim.cmd.Ex) -- Open file explorer


-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" }) -- move current line down
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" }) -- move current line up
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" }) -- move selected lines down
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" }) -- move selected lines up
keymap.set("i", "<A-j>", "<ESC>:m .+1<CR>==gi", { desc = "Move current line down in insert mode" }) -- move current line down in insert mode
keymap.set("i", "<A-k>", "<ESC>:m .-2<CR>==gi", { desc = "Move current line up in insert mode" }) -- move current line up in insert mode
-- move selected words
keymap.set("n", "<A-h>", "viw<ESC>:m '<-2<CR>==", { desc = "Move selected word left" }) -- move selected word left
keymap.set("n", "<A-l>", "viw<ESC>:m '>+1<CR>==", { desc = "Move selected word right" }) -- move selected word right


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window hotizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows squal size
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
-- navigate between splits
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left split" }) -- navigate to left split
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom split" }) -- navigate to bottom split
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to top split" }) -- navigate to top split
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right split" }) -- navigate to right split

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- open current buffer in new tab

