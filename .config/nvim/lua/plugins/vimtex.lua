return {
	{
	"lervag/vimtex", -- for latex
	lazy = false, 
	init = function()
		vim.g.vimtex_quickfix_mode = 2 -- Open quickfix window on error
		vim.g.vimtex_compiler_latexmk_engines = {["_"] = "-lualatex -shell-escape"} -- Use lualatex
		vim.g.vimtex_indent_on_ampersands = 0 -- Don't indent on ampersands
		vim.g.vimtex_view_method = 'sioyek' -- Use sioyek for pdf viewing
		vim.g.matchup_override_vimtex = 1 -- Use vimtex for matching
	end,
	}
} 
