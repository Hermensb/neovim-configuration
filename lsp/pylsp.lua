---@type vim.lsp.Config
return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },

        ruff = {
          enabled = true,
          formatEnabled = true,
        },

        pylsp_mypy = {
          enabled = true,
          live_mode = true,
          dmypy = false,
          strict = false,
        },
      },
    },
  },
}
