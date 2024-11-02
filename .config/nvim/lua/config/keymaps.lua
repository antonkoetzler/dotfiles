-- All key mappings are located here.

local opts = { noremap = true, silent = true }

-- Leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Telescope.
vim.api.nvim_set_keymap('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', opts) -- Fuzzy file search.
vim.api.nvim_set_keymap('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', opts)  -- Fuzzy live grep.
vim.api.nvim_set_keymap('n', '<LEADER>fh', '<CMD>Telescope buffers<CR>', opts)    -- Buffer list.
