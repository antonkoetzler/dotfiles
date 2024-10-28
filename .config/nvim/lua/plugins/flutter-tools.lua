return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require('flutter-tools').setup({
      lsp = {
        on_attach = require('config.on_attach'),
        settings = {
          lineLength = 160,              -- Default line length.
          showTodos = true,              -- Highlights // TODO.
          completeFunctionCalls = false, -- Autocompletes where it completes the arguments of a method/constructor.
        },
      },
      widget_guides = {
        enabled = true, -- Shows lines connecting each widget.
      },
      dev_log = {
        open_cmd = 'botright 15split new', -- Show the console (i.e. that pops up when using :FlutterRun) at the bottom of the screen.
      },
    })
  end,
}
