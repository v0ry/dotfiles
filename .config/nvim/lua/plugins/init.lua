return {
    	{"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
		    highlight = {enable = true, disable = {"latex"}},
		    playground = {
			enable = true,
			updatetime = 25 -- Debounced time for highlighting nodes in the playground from source code
		    },
		    indent = {enable = true},
		    textobjects = {
			move = {
			    enable = true,
			    set_jumps = true, -- whether to set jumps in the jumplist
			    goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = {query = "@class.outer", desc = "Next class start"},
				["]s"] = {
				    query = "@scope",
				    query_group = "locals",
				    desc = "Next scope"
				}
			    },
			    goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer"
			    },
			    goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer"
			    },
			    goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer"
			    },
			    goto_next = {["]d"] = "@conditional.outer"},
			    goto_previous = {["[d"] = "@conditional.outer"}
			},
			swap = {
			    enable = true,
			    swap_next = {["<leader>a"] = "@parameter.inner"},
			    swap_previous = {["<leader>A"] = "@parameter.inner"}
			},
			select = {
			    enable = true,
			    lookahead = true,
			    keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner"
			    },
			    selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>" -- blockwise
			    }
			}
		    },
		    incremental_selection = {
			enable = true,
			keymaps = {
			    init_selection = "<space>i",
			    scope_incremental = "<space>i",
			    node_incremental = "<space>n",
			    node_decremental = "<space>p"
			}
		    }
		})
	end,
	},
    {"nvim-treesitter/nvim-treesitter-textobjects", event = "InsertEnter"}, -- TS objects
    {"folke/ts-comments.nvim", opts = {}, event = "VeryLazy"}, -- use TS for comment.nvim
    {"nvim-treesitter/playground", lazy = true, cmd = "TSPlaygroundToggle"}, -- playing around with treesitter
    {"danymat/neogen", config = true}, 
    {
        "haringsrob/nvim_context_vt",
        config = function()
            require("nvim_context_vt").setup({
                disable_ft = {"rust", "rs"},
                disable_virtual_lines = true,
                min_rows = 8
            })
        end,
    }, 
    {"kevinhwang91/nvim-bqf"}, -- beter quickfix
    {"sbdchd/neoformat"}, -- format code
    {"mbbill/undotree", lazy = true, cmd = "UndotreeToggle"}, -- see undo tree
        {
        "smjonas/live-command.nvim", -- live command
        config = function()
            require("live-command").setup({commands = {Norm = {cmd = "norm"}}})
        end,
    }, 
    {
        "rmagatti/auto-session", -- auto save session
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = {
                    "~/", "~/Downloads", "~/Documents"
                },
                auto_session_use_git_branch = true,
                auto_save_enabled = true
            })
        end,
    }, 
    {
        "nmac427/guess-indent.nvim", -- guess indent
        config = function() require("guess-indent").setup({}) end,
    }, {"tpope/vim-repeat"}, -- repeat
    {
        "kylechui/nvim-surround", -- surround objects
        config = function() require("nvim-surround").setup({}) end,
    }, {"mhinz/vim-grepper"}, -- rg support
    {"gelguy/wilder.nvim", build = ":UpdateRemotePlugins"}, -- : autocomplete
    {"tpope/vim-fugitive"}, -- Git control for vim
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
    {"lervag/vimtex"}, -- for latex
    {"akinsho/toggleterm.nvim"}, -- for smart terminal
    {"puremourning/vimspector"}, -- debugging
}


