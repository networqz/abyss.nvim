return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        { "saghen/blink.cmp", version = "1.*" },
        { "folke/lazydev.nvim", ft = "lua" }
    },
    config = function()
        local servers = {
            clangd = {},
            html = {},
            cssls = {},
            ts_ls = {},
            lua_ls = {}
        }

        require("mason").setup({})

        require("blink.cmp").setup({
            keymap = {
                preset = "default"
            },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                documentation = {
                    auto_show = false
                }
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning"
            },
            signature = {
                enabled = true
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
                    require("lspconfig")[server_name].setup(server)
                end
            }
        })

        require("lazydev").setup({
            library = {
                {
                    path = "${3rd}/luv/library",
                    words = { "vim%.uv" }
                }
            }
        })

        -- TODO: PLAY AROUND WITH DIAGNOSTIC MESSAGES TO GET THE DESIRED LOOK
        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config({
            severity_sort = true,
            float = {
                border = 'rounded',
                source = 'if_many'
            },
            underline = {
                severity = vim.diagnostic.severity.ERROR
            },
            signs = vim.g.have_nerd_font and {

                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 '
                },
            } or {},
            virtual_text = {
                source = 'if_many',
                spacing = 2
            },
        })

        -- add keymaps and custom highlight behaviour
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("abyss-lsp-attach", { clear = true }),
            callback = function(attach_args)
                -- helper function to checking client capabilities
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has 'nvim-0.11' == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                local client = vim.lsp.get_client_by_id(attach_args.data.client_id)
                if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, attach_args.buf) then
                    -- vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = args.buf, description = "rename" })

                    local highlight_augroup = vim.api.nvim_create_augroup("abyss-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = attach_args.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight

                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = attach_args.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("abyss-lsp-detach", {clear = true }),
                        callback = function(detach_args)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({
                                group = highlight_augroup,
                                buffer = detach_args.buf
                            })
                        end
                    })
                end
            end
        })
    end
}
