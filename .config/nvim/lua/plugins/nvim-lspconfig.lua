return {
  'neovim/nvim-lspconfig',
  depedencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local on_attach = require('config.on_attach')

    -- Lua.
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    -- Go.
    lspconfig.gopls.setup({
      on_attach = function(cliente, bufnr)
        on_attach(cliente, bufnr)
        vim.bo[bufnr].expandtab = false
        vim.bo[bufnr].tabstop = 4
        vim.bo[bufnr].shiftwidth = 4
      end,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })

    -- Typescript.
    lspconfig.ts_ls.setup({
      on_attach = on_attach,
      settings = {
        javascript = {
          format = {
            quoteStyle = "single"
          }
        },
        typescript = {
          format = {
            quoteStyle = "single"
          }
        }
      },
    })
  end,
}
