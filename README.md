# Neovim Configuration

Clone to `~/.config/nvim`, then run `nvim`. lazy.nvim installs automatically.

## Key Mappings

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Buffers |
| `<Space>fh` | Help tags |
| `<C-Space>` | Trigger completion |
| `<CR>` / `<C-e>` | Confirm / cancel completion |

## Adding a Plugin

Drop a file in `lua/plugins/` returning a lazy.nvim spec, then run `:Lazy`.
