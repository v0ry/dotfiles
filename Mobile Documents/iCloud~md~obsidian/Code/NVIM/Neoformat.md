```
	keys = { -- keys == keybindings 
		{"<leader>e", "<cmd>:Neoformat<cr>", desc = "Neoformat" }
	},

```

^f64c7c

^872b35
**Keybinding** executes `:set Neoformat` of current file with shortcut `,+e` . 

![[Screen Recording 2024-09-26 at 3.23.05 AM.gif]]
```
--Editad 092024
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
```
