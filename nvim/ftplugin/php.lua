-- indentation settings
vim.bo.expandtab   = true
vim.bo.autoindent  = true
vim.bo.tabstop     = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth  = 4

vim.keymap.set('', '<Leader>r', '<Cmd>TermExec cmd="php -S localhost:8888\n"<CR>')

vim.cmd("Rooter")
