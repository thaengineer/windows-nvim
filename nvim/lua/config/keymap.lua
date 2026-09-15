-- Clear Highlight
vim.keymap.set('n', '<C-l>', ':nohl<CR>')

-- Neotree
vim.keymap.set('n', '<leader>fe', '<cmd>Neotree toggle<cr>')

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>",  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>",    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>",  { desc = "Help tags" })
