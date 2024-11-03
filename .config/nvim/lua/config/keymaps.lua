-- All key mappings & shortcuts (doesn't include shortcuts for LSP actions).

local opts = { noremap = true, silent = true }

-- Leader keys.
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- General shortcuts.
vim.api.nvim_set_keymap('i', '<C-Backspace>', '<C-w>', opts)          -- Ctrl + backspace.
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>', opts)                  -- Ctrl + backspace.
vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>tabnew<CR>', opts)   -- Create a new tab.
vim.api.nvim_set_keymap('n', '<leader>tx', '<cmd>tabclose<CR>', opts) -- Close a tab.
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>tabnext<CR>', opts)  -- Move to the previous tab.
vim.api.nvim_set_keymap('n', '<leader>tp', '<cmd>tabprev<CR>', opts)  -- Move to the next tab.
vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>bd<CR>', opts)        -- Delete a buffer.
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>bp<CR>', opts)        -- Move to the previous buffer.
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>bn<CR>', opts)        -- Move to the next buffer.

-- bufferline.
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>BufferLinePickClose<CR>', opts) -- Select a specific buffer to close.
vim.api.nvim_set_keymap('n', '<leader>op', '<cmd>BufferLineMovePrev<CR>', opts) -- Moves the selected buffer to the left of the buffer line.
vim.api.nvim_set_keymap('n', '<leader>on', '<cmd>BufferLineMoveNext<CR>', opts) -- Moves the selected buffer to the right of the buffer line.

-- Telescope.
vim.api.nvim_set_keymap('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', opts) -- Fuzzy file search.
vim.api.nvim_set_keymap('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', opts)  -- Fuzzy live grep.
vim.api.nvim_set_keymap('n', '<LEADER>fh', '<CMD>Telescope buffers<CR>', opts)    -- Buffer list.

-- nvim-tree.
vim.api.nvim_set_keymap('n', '<LEADER>e', '<CMD>:NvimTreeToggle<CR>', opts) -- Toggle the tree.
