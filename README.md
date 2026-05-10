# Neovim Configuration

Clone to `~/.config/nvim`, then run `nvim`. lazy.nvim installs automatically.

## Plugins Installed via lazy.nvim

| Plugin | Purpose |
|--------|---------|
| `telescope.nvim` | Fuzzy finder / file picker |
| `nvim-cmp` | Autocompletion framework |
| `cmp-nvim-lsp` | LSP source for cmp |
| `cmp-buffer` | Buffer words source for cmp |
| `cmp-path` | Filepath source for cmp |
| `LuaSnip` | Snippet engine |
| `cmp_luasnip` | Snippet source for cmp |
| `pop-punk.vim` | Colorscheme |

## Python LSP

This config uses `python-lsp-server` (pylsp) with plugins for ruff and mypy:

| Package | Purpose |
|---------|---------|
| `python-lsp-server` | Jedi-based LSP: completions, go-to-def, hover, references, etc. |
| `python-lsp-ruff` | Fast linting + formatting via ruff (auto-disables legacy linters) |
| `pylsp-mypy` | Type checking via mypy (live mode enabled) |
| `pynvim` | Python 3 provider for Neovim |

### Installing Python LSP Dependencies

**Option 1: From inside Neovim (recommended)**

Activate your project's Python venv, open Neovim, and run:

```vim
:InstallPythonLSP
```

This executes `python -m pip install -U python-lsp-server python-lsp-ruff pylsp-mypy pynvim` using the `python`/`python3` from your `PATH` (your activated venv).

**Option 2: Manually from your terminal**

With your venv activated:

```bash
pip install python-lsp-server python-lsp-ruff pylsp-mypy pynvim
```

**Restart Neovim** (or run `:LspRestart`) after installation.

### LSP Key Mappings

Available when an LSP client attaches to a Python buffer:

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Telescope: Find references |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |
| `<Space>f` | Format buffer (via ruff) |

### Autocompletion (nvim-cmp)

| Key | Action |
|-----|--------|
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-y>` | Confirm completion |
| `<C-Space>` | Trigger completion |

## General Key Mappings

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Buffers |
| `<Space>fh` | Help tags |

## Adding a Plugin

Drop a file in `lua/plugins/` returning a lazy.nvim spec, then run `:Lazy`.

## Project-level Configuration

`python-lsp-ruff` and `pylsp-mypy` respect your project's configuration files:

**`pyproject.toml`:**
```toml
[tool.ruff]
line-length = 88
extend-select = ["I"]  # isort import sorting

[tool.mypy]
python_version = "3.11"
# strict = true

[tool.pylsp-mypy]
enabled = true
live_mode = true
```

Or use standalone config files: `ruff.toml`, `mypy.ini`, `.mypy.ini`, `setup.cfg`.
