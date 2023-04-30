-- Require LSP configuration from the plugin so we can attach GOPLS to it
lspconfig = require "lspconfig"
util = require "lspconfig/util"

--how to configure a langugage server
lspconfig.gopls.setup {
	cmd = {"gopls","serve"},
	filetypse = {"go","gomod"},
	root_dir = util.root_pattern{"go.work","go.mod",".git"},
	settings = {
		gopls ={
			analyses ={
				unusedparams = true,
			},
			staticcheck = true,
		},
	},

}
