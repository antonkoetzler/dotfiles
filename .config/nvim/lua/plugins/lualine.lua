return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      sections = {
        -- Current vim mode.
        lualine_a = {
          'mode',
        },

        -- Git & LSP information.
        lualine_b = {
          'branch',
          'diff',
          'diagnostics',
        },

        -- Current file's path.
        lualine_c = {
          {
            'filename',
            path = 2
          },
        },

        -- Current file's information
        lualine_y = {
          'encoding',
          'filetype',
        },

        -- Row & column cursor is on.
        lualine_z = {
          'location',
        }
      },
    })
  end,
}
