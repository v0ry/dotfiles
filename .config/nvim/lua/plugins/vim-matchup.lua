return {
	'andymass/vim-matchup',
	config = function()
		vim.api.nvim_set_hl(0, "OffScreenPopup",
				{fg = "#fe8019", bg = "#3c3836", italic = true})
		vim.g.matchup_matchparen_offscreen = {
			method = "popup",
			highlight = "OffScreenPopup",
	}
	end,
}
