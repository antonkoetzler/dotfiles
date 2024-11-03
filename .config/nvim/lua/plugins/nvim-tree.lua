return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    's1n7ax/nvim-window-picker',
  },
  config = function()
    require('nvim-tree').setup({
      git = {
        enable = false, -- Disable git notifiers.
      },
      view = {
        side = 'right',       -- Place the tree on the right.
        adaptive_size = true, -- Adaptive size of tree for fitting names better.
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = function()
              -- Only show dialog to pick a window if there are multiple windows open.
              if vim.fn.winnr('$') > 1 then
                return require('window-picker').pick_window({
                  hint = 'floating-big-letter',
                })
              else
                return nil
              end
            end,
          },
        },
      },
      diagnostics = {
        enable = true,       -- Enable functionality to show errors of files.
        show_on_dirs = true, -- Show error notifiers on parent directory of file with error.
      },
      update_focused_file = {
        enable = true, -- Jumps to the focused buffer when opened.
      },
    })
  end,
}
