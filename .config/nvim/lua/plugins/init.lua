return {
    {
        "nmac427/guess-indent.nvim", -- guess indent
        config = function() require("guess-indent").setup({}) end,
    }, {"tpope/vim-repeat"}, -- repeat
    {
        "kylechui/nvim-surround", -- surround objects
        config = function() require("nvim-surround").setup({}) end,
    }, {"mhinz/vim-grepper"}, -- rg support
    {"gelguy/wilder.nvim", build = ":UpdateRemotePlugins"}, -- : autocomplete
    {"windwp/nvim-autopairs", event = "InsertEnter"}, -- autopairs
    {
        'andymass/vim-matchup',
        config = function()
            vim.api.nvim_set_hl(0, "OffScreenPopup",
                            {fg = "#fe8019", bg = "#3c3836", italic = true})
            vim.g.matchup_matchparen_offscreen = {
                method = "popup",
                highlight = "OffScreenPopup"
            }
        end,
    }, {"uga-rosa/ccc.nvim"}, -- color highlighting
    {"wellle/targets.vim"}, -- adds more targets like [ or ,
    {"3rd/image.nvim"},
    {"akinsho/toggleterm.nvim"}, -- for smart terminal
    {"puremourning/vimspector"}, -- debugging
}


