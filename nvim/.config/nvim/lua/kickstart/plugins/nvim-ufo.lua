return {
  'kevinhwang91/nvim-ufo',
  event = 'BufReadPost',
  dependencies = { 'kevinhwang91/promise-async' },

  config = function()
    -- Fold options
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- UFO keymaps
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Fold less' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Fold more' })
    vim.keymap.set('n', 'zp', require('ufo').peekFoldedLinesUnderCursor, { desc = 'Peek fold' })

    -- Provider selection
    require('ufo').setup {
      provider_selector = function(_, filetype, buftype)
        local function fallback(bufnr, err, provider)
          if type(err) == 'string' and err:match 'UfoFallbackException' then
            return require('ufo').getFolds(bufnr, provider)
          else
            return require('promise').reject(err)
          end
        end

        return (filetype == '' or buftype == 'nofile') and 'indent'
          or function(bufnr)
            return require('ufo')
              .getFolds(bufnr, 'lsp')
              :catch(function(err)
                return fallback(bufnr, err, 'treesitter')
              end)
              :catch(function(err)
                return fallback(bufnr, err, 'indent')
              end)
          end
      end,
    }
  end,
}
