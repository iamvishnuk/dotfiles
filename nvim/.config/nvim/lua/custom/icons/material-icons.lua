local icons = {}

icons.file = {
  -- Programming Languages
  ['ts'] = '',
  ['tsx'] = '',
  ['js'] = '',
  ['jsx'] = '',
  ['mjs'] = '',
  ['cjs'] = '',
  ['json'] = '',
  ['java'] = '',
  ['go'] = '',
  ['py'] = '',
  ['lua'] = '',
  ['rb'] = '',
  ['rs'] = '',
  ['php'] = '',
  ['swift'] = '',
  ['cs'] = '󰌛',
  ['sh'] = '',

  -- Web / UI
  ['html'] = '',
  ['css'] = '',
  ['scss'] = '',
  ['sass'] = '',
  ['less'] = '',
  ['vue'] = '󰡄',
  ['svelte'] = '󰡄',

  -- Config files
  ['env'] = '',
  ['toml'] = '',
  ['yaml'] = '',
  ['yml'] = '',
  ['ini'] = '',

  -- Build systems
  ['dockerfile'] = '',
  ['docker'] = '',
  ['makefile'] = '',

  -- Data
  ['csv'] = '',
  ['xml'] = '',
  ['sql'] = '',

  -- Media
  ['png'] = '',
  ['jpg'] = '',
  ['jpeg'] = '',
  ['gif'] = '',
  ['svg'] = '󰜡',
  ['mp4'] = '',
  ['mp3'] = '',

  -- Misc
  ['md'] = '',
  ['txt'] = '',
  ['log'] = '',
}

icons.by_filename = {
  ['.gitignore'] = '󰊢',
  ['.gitattributes'] = '󰊢',
  ['.npmrc'] = '',
  ['package.json'] = '',
  ['package-lock.json'] = '',
  ['tsconfig.json'] = '',
  ['jsconfig.json'] = '',
  ['tailwind.config.js'] = '󱏿',
  ['postcss.config.js'] = '󰉢',
  ['vite.config.js'] = '󰖟',
  ['vite.config.ts'] = '󰖟',
  ['next.config.js'] = '󰎙',
  ['nuxt.config.js'] = '󰎙',
  ['astro.config.mjs'] = '󰎙',
  ['.eslintrc'] = '',
  ['.eslintrc.js'] = '',
  ['.prettierrc'] = '',
  ['.prettierrc.json'] = '',
  ['docker-compose.yml'] = '',
  ['.env.local'] = '',
  ['.env.production'] = '',
}

icons.folders = {
  ['src'] = '󰱼',
  ['components'] = '󰡄',
  ['assets'] = '󰉏',
  ['public'] = '',
  ['config'] = '',
  ['controllers'] = '󰠱',
  ['models'] = '',
  ['routes'] = '󰖡',
  ['middleware'] = '󰘳',
  ['lib'] = '󰌠',
  ['utils'] = '󰆧',
  ['hooks'] = '󰊠',
  ['store'] = '󰄠',
  ['types'] = '󰆧',
  ['tests'] = '󰙨',
  ['build'] = '󰛫',
  ['dist'] = '󰛫',
  ['node_modules'] = '',
}

icons.git = {
  added = '󰐕',
  modified = '󰷉',
  removed = '󰮘',
  renamed = '󰑕',
  untracked = '󰗉',
  ignored = '󰯄',
  staged = '󰄬',
  conflict = '',
}

-- Neo-tree icon resolver
icons.neo_tree_icon = function(config, node)
  local name = node.name
  local ext = node.ext
  local type = node.type

  -- folders
  if type == 'directory' then
    return icons.folders[name] or config.default
  end

  -- special filenames
  if icons.by_filename[name] then
    return icons.by_filename[name]
  end

  -- extensions
  if ext and icons.file[ext] then
    return icons.file[ext]
  end

  return config.default
end

return icons
