--completeopt is used to manage code suggestion format

vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert', 'preview' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

local cmp = require'cmp'

cmp.setup({
	--Configurations
	--sources are installed that can be used for code suggestions
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp', keyword_length = 3 },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua', keyword_length = 2 },
		{ name = 'buffer', keyword_length = 2 },
		{ name = 'vsnip', keyword_length = 2 },
	},

	--Window for styling
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	--formatting
	formatting = {
		fields = {'menu', 'abbr', 'kind'},
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				vsnip = 'σ',
				buffer = 'β',
				path = 'π',

			}
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},

	-- Mappings are keyboard shortcuts to execute commands
	mapping = {
		--Shift + TAB go to previous suggest item
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		
		--Tab to go to the next item
		['<Tab>'] = cmp.mapping.select_next_item(),

		--CTRL+SPACE to bring up the code completion at current cursor
		['<C-Space>'] = cmp.mapping.complete(),

		--CTRL+e closes the suggestion tab
		['<C-e>'] = cmp.mapping.close(),

		--Pressing Enter or Return will Confirm and apply
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})

		
	}
})
