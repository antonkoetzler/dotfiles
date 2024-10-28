return {
  'MeanderingProgrammer/dashboard.nvim',
  event = 'VimEnter',
  dependencies = {
    {
      'MaximilianLloyd/ascii.nvim',
      dependencies = { 'MunifTanjim/nui.nvim' },
    },
  },
  config = function()
    require('dashboard').setup({
      header = require('ascii').art.animals.cats.luna,
      footer = {
        '',
        'ANTON\'S NVIM',
      },
    })
  end,
}
