return {
  'nvim-tree/nvim-web-devicons',
  lazy = false,
  priority = 1000,
  config = function()
    require('nvim-web-devicons').setup {
      color_icons = true,
      strict = false,
      override_by_filename = {
        ['.env'] = { icon = '', color = '#faf743', name = 'Env' },
        ['.env.development'] = { icon = '', color = '#faf743', name = 'Env' },
        ['.env.production'] = { icon = '', color = '#faf743', name = 'Env' },
        ['.env.test'] = { icon = '', color = '#faf743', name = 'Env' },
        ['.env.local'] = { icon = '', color = '#faf743', name = 'Env' },
        ['.env.example'] = { icon = '', color = '#faf743', name = 'Env' },
        ['package.json'] = { icon = '󰎙', color = '#6CC24A', name = 'PackageJson' },
        ['package-lock.json'] = { icon = '󰎙', color = '#6CC24A', name = 'PackageJson' },
      },
    }
  end,
}
