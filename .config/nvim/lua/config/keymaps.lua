-- All key mappings & shortcuts (doesn't include shortcuts for LSP actions).

local opts = { noremap = true, silent = true }

-- Leader keys.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- General shortcuts.
vim.api.nvim_set_keymap('i', '<C-Backspace>', '<C-w>', opts)          -- Ctrl + backspace.
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', opts)                  -- Ctrl + backspace.
vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>tabnew<cr>', opts)   -- Create a new tab.
vim.api.nvim_set_keymap('n', '<leader>tx', '<cmd>tabclose<cr>', opts) -- Close a tab.
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>tabnext<cr>', opts)  -- Move to the previous tab.
vim.api.nvim_set_keymap('n', '<leader>tp', '<cmd>tabprev<cr>', opts)  -- Move to the next tab.
vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>bd<cr>', opts)        -- Delete a buffer.
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>bp<cr>', opts)        -- Move to the previous buffer.
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>bn<cr>', opts)        -- Move to the next buffer.

-- bufferline.
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>BufferLinePickClose<cr>', opts) -- Select a specific buffer to close.
vim.api.nvim_set_keymap('n', '<leader>op', '<cmd>BufferLineMovePrev<cr>', opts) -- Moves the selected buffer to the left of the buffer line.
vim.api.nvim_set_keymap('n', '<leader>on', '<cmd>BufferLineMoveNext<cr>', opts) -- Moves the selected buffer to the right of the buffer line.

-- Telescope.
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)   -- Fuzzy file search.
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)    -- Fuzzy live grep.
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope buffers<cr>', opts)      -- Buffer list.

-- neo-tree.
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>Neotree toggle reveal right<cr>', opts)
