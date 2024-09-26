return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  keys = {
    { "<leader>ck", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", desc = "Toggle Copilot Auto Trigger" },
  },
  config = function ()
	require("copilot").setup({
	    panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
		    jump_prev = "[[",
		    jump_next = "]]",
		    accept = "<CR>",
		    refresh = "gr",
		    open = "<leader>ck"
		},
		layout = {
		    position = "bottom", -- | top | left | right
		    ratio = 0.4
		},
	    },
	    suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
		    accept = "<C-v>",
		    accept_word = false,
		    accept_line = "<C-q>",
		    next = false,
		    prev = false,
		    dismiss = "<C-]>"
		}
	    },
	    filetypes = {
		markdown = true,
		gitcommit = false,
		yaml = false,
		help = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		VimspectorPrompt = false,
		["."] = false
	    },
	    copilot_node_command = "node",
	    server_opts_overrides = {}
	})
  end, -- Lua requires config = function() ... end,
}
