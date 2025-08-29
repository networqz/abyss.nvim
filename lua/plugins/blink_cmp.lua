return {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
        keymap = {
            preset = "default",
        },
        appearance = {
            nerd_font_variant = "mono"
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                }
            }
        }
    },
    opts_extend = { "sources.default" }
}

