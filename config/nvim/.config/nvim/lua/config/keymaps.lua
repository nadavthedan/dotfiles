-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- ====================== NORMAL MODE =============================
keymap("n", "<A-h>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Buffer Prev" })
keymap("n", "<A-l>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Buffer Next" })

-- ====================== INSERT MODE =============================
keymap("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
keymap("i", "<C-BS>", "<C-w>", { desc = "Delete previous word" })
