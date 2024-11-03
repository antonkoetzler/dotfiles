return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    local cmp = require('cmp')

    require('cmp').setup({
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        {
          name = 'nvim_lsp',                       -- Source of the autocompletes: Nvim's default LSP.
          entry_filter = function(entry)
            return entry.completion_item.kind ~= 4 -- Disables suggestions that autofill arguments (i.e. a function).
          end,
        },
        { name = 'buffer' },  -- Completions based on current buffer.
        { name = 'path' },    -- Completions based on file path.
        { name = 'luasnip' }, -- Completions based off of words used in your loaded buffer.
      },
    })
  end,
}
