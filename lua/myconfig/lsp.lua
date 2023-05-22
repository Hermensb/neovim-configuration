local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local handlers = {
    function (server_name) -- default handler (optional)
        lspconfig[server_name].setup {
            capabilities = capabilities
        }
    end,
    ["rust_analyzer"] = function ()
        require("rust-tools").setup {}
    end,
    ["lua_ls"] = function ()
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,
    ["pylsp"] = function()
        lspconfig.pylsp.setup{
            settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            maxLineLength = 100
                        },
                        mypy = {
                            enable = true
                        }
                    }
                }
            }
        }
    end,
}

mason.setup()
mason_lspconfig.setup{
    ensure_installed = {},
    automatic_installation = true,
    handlers = handlers,
}

