local keyset = vim.keymap.set
local M = {} 

keyset("i", "jk", "<esc>")

keyset("v", "J", ":m '>+1<cr>gv=gv")
keyset("v", "K", ":m '<-2<cr>gv=gv")
keyset("n", "<space>h", "<c-w>h")
keyset("n", "<space>j", "<c-w>j")
keyset("n", "<space>k", "<c-w>k")
keyset("n", "<space>l", "<c-w>l")
keyset("n", "<leader>wh", "<c-w>t<c-h>H")
keyset("n", "<leader>wk", "<c-w>t<c-h>K")
keyset("n", "<down>", ":resize +2<cr>")
keyset("n", "<up>", ":resize -2<cr>")
keyset("n", "<right>", ":vertical resize +2<cr>")
keyset("n", "<left>", ":vertical resize -2<cr>")
keyset("n", "j", "(v:count ? 'j' : 'gj')", {expr = true})
keyset("n", "k", "(v:count ? 'k' : 'gk')", {expr = true})

-- remap to include undo and more things
keyset("i", ",", ",<C-g>U")
keyset("i", ".", ".<C-g>U")
keyset("i", "!", "!<C-g>U")
keyset("i", "?", "?<C-g>U")
keyset("x", ".", ":norm.<cr>")
keyset("x", "<leader>y", '"*y :let @+=@*<cr>')
keyset("n", "<a-x>", "<nop>")
keyset("n", "<backspace>", "<C-^")
keyset("n", "cp", "yap<S-}p")

-- general
keyset("n", "<leader>x", "ZZ")
keyset("n", "<leader>P", '"+gP')
keyset("n", "<leader>p", '"+gp')
keyset("n", "<leader>z", "[s1z=``") -- Spell Check
keyset("n", "<leader>sr", ":%s/<<C-r><C-w>>//g<Left><Left>")

-- Glolbal Keymap specific plugins
--local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
--keyset({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move_next)
--keyset({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_previous)
--keyset({"n", "x", "o"}, "f", ts_repeat_move.builtin_f)
--keyset({"n", "x", "o"}, "F", ts_repeat_move.builtin_F)
--keyset({"n", "x", "o"}, "t", ts_repeat_move.builtin_t)
--keyset({"n", "x", "o"}, "T", ts_repeat_move.builtin_T)

-- Telescope & grepper
keyset("n", "<leader><leader>f", ":Telescope git_files<cr>")
keyset("n", "<leader>fl", ":Telescope live_grep<cr>")
keyset("n", "<leader>ff",
       ":Telescope frecency workspace=CWD theme=ivy layout_config={height=0.4} path_display={'shorten'}<cr>")
keyset("n", "<leader>fb", ":Telescope buffers<cr>")
keyset("n", "<leader>fm", ":Telescope man_pages<cr>")
keyset("n", "<leader>ft", ":Telescope treesitter<cr>")
keyset("n", "<leader>fk", ":Telescope keymaps<cr>")
keyset("n", "<leader>fh", ":Telescope help_tags<cr>")
keyset("n", "<leader>fs", ':GrepperRg "" .<Left><Left><Left>')
keyset("n", "<leader>fS", ":Rg<space>")
keyset("n", "<leader>*", ":Grepper -tool rg -cword -noprompt<cr>")
keyset("n", "gs", "<Plug>(GrepperOperator)")
keyset("x", "gs", "<Plug>(GrepperOperator)")

-- Netrw 
keyset("n", "<leader>dd", "<cmd>Lexplore %:p:h<cr>")
keyset("n", "<leader>da", "<cmd>Lexplore<cr>")

-- LuaSnip

