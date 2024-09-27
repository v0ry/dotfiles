return {
    {  'nvim-tree/nvim-web-devicons' }, 
    {
        "nmac427/guess-indent.nvim", -- guess indent
        config = function() require("guess-indent").setup({}) end,
    }, {"tpope/vim-repeat"}, -- repeat
 {"mhinz/vim-grepper"}, -- rg support
    {"gelguy/wilder.nvim", build = ":UpdateRemotePlugins"}, -- : autocomplete
    {"windwp/nvim-autopairs", event = "InsertEnter"}, -- autopairs
    {"uga-rosa/ccc.nvim"}, -- color highlighting
    {"wellle/targets.vim"}, -- adds more targets like [ or ,
    {"3rd/image.nvim"},
    {"akinsho/toggleterm.nvim"}, -- for smart terminal
    {"puremourning/vimspector"}, -- debugging
}


