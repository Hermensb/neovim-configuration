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

      local function get_python()
        local python = vim.fn.exepath('python3')
        if python == '' then
          python = vim.fn.exepath('python')
        end
        return python
      end

      vim.api.nvim_create_user_command('InstallPythonLSP', function()
        local python = get_python()
        if python == '' then
          vim.notify('Python not found in PATH', vim.log.levels.ERROR)
          return
        end

        local packages = {
          'python-lsp-server',
          'python-lsp-ruff',
          'pylsp-mypy',
          'pynvim',
        }

        vim.notify(
          string.format('Installing Python LSP packages using: %s', python),
          vim.log.levels.INFO
        )

        local cmd = vim.list_extend({ python, '-m', 'pip', 'install', '-U' }, packages)

        vim.fn.jobstart(cmd, {
          on_stdout = function(_, data)
            for _, line in ipairs(data) do
              if line ~= '' then
                vim.notify(line, vim.log.levels.INFO)
              end
            end
          end,
          on_stderr = function(_, data)
            for _, line in ipairs(data) do
              if line ~= '' then
                vim.notify(line, vim.log.levels.WARN)
              end
            end
          end,
          on_exit = function(_, code)
            if code == 0 then
              vim.notify(
                'Successfully installed Python LSP packages. Restart Neovim or run :LspRestart.',
                vim.log.levels.INFO
              )
            else
              vim.notify(
                string.format('Failed to install Python LSP packages (exit code %d)', code),
                vim.log.levels.ERROR
              )
            end
          end,
        })
      end, {
        desc = 'Install python-lsp-server, python-lsp-ruff, pylsp-mypy, and pynvim into the current Python environment',
      })

      vim.lsp.enable('pylsp')
    end,
  },
}
