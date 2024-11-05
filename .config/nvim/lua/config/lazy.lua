-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  require('plugins.telescope'),       -- Good for file navegation (i.e. fuzzy searching, livegrep, etc).
  require('plugins.lualine'),         -- Status bar with various information at the bottom of the screen.
  require('plugins.vim-fugitive'),    -- Lots of git features; I mainly use to solve merge conflicts.
  require('plugins.scope'),           -- Separate buffers shown in telescope by tab.
  require('plugins.dashboard'),       -- Shows a kitty on startup.
  require('plugins.kommentary'),      -- Allows gc/gcc comments (for commenting lines of code) to work cross-platform.
  require('plugins.nvim-lspconfig'),  -- LSP: Base configuraiton plugin.
  require('plugins.mason'),           -- LSP: Language server installer.
  require('plugins.mason-lspconfig'), -- LSP: Automatically installs defined LSPs.
  require('plugins.nvim-cmp'),        -- LSP: suggestions & autocompletes.
  require('plugins.flutter-tools'),   -- LSP & other goodies for Flutter.
  require('plugins.git-blame'),       -- Git blame on lines.
  require('plugins.bufferline'),      -- Buffer tab bar.
  require('plugins.diffview'),        -- Viewing git differences and also merge conflict resolver tool.
  require('plugins.neotree'),         -- File tree/explorer plugin.

  -- Color schemes.
  require('plugins.vim-moonfly-colors'),
  require('plugins.vim-nightfly-colors'),
})
