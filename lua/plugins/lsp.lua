return {
  {
    'hrsh7th/cmp-nvim-lsp',
    config = function()
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('*', {
        capabilities = lsp_capabilities,
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>f', function()
            vim.lsp.buf.format({ async = true })
          end, '[F]ormat')
        end,
      })

      vim.lsp.enable('pylsp')
    end,
  },
}
