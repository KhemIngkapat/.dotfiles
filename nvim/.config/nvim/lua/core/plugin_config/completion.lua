local cmp = require("cmp")

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
	["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>']  = cmp.mapping.confirm({select = true}),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --                             if cmp.visible() then
        --                                 cmp.select_next_item()
        --                             elseif luasnip.expandable() then
        --                                 luasnip.expand()
        --                             elseif luasnip.expand_or_jumpable() then
        --                                 luasnip.expand_or_jump()
        --                             elseif check_backspace() then
        --                                 fallback()
        --                             else
        --                                 fallback()
        --                             end
        --                         end, {"i","s",}),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --                             if cmp.visible() then
        --                                 cmp.select_prev_item()
        --                             elseif luasnip.jumpable(-1) then
        --                                 luasnip.jump(-1)
        --                             else
        --                                 fallback()
        --                             end
        --                         end, {"i","s",}),
    }),

    snippet = {
        expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
    },

    sources = cmp.config.sources(
        {{name = 'nvim_lsp'},{name='luasnip'}},
        {{name = 'buffer'}}
    ),

})
