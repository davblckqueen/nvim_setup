return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip", -- For snippet support
    },
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(), -- Navigate to the next item in the completion menu
                ['<C-p>'] = cmp.mapping.select_prev_item(), -- Navigate to the previous item in the completion menu
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),    -- Scroll documentation up
                ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- Scroll documentation down
                ['<C-Space>'] = cmp.mapping.complete(),     -- Trigger completion
                ['<C-e>'] = cmp.mapping.abort(),            -- Abort completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item() -- Navigate to the next item if completion menu is visible
                    else
                        fallback() -- Fallback to default behavior
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item() -- Navigate to the previous item if completion menu is visible
                    else
                        fallback() -- Fallback to default behavior
                    end
                end, { 'i', 's' }),
            })
        })
    end
}
