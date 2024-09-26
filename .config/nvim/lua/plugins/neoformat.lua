return {
	"sbdchd/neoformat",
	keys = { -- keys == keybindings 
		{"<leader>e", "<cmd>:Neoformat<cr>", desc = "Neoformat" }
	},
	init = function() -- init == settings  
		vim.g.neoformat_try_formatprg = 1
		vim.g.latexindent_opt = "-m" -- for neorg
		vim.g.shfmt_opt="-ci"
	end,
	
}
