return {
  -- Your other plugins can be listed here
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-\>]], -- Default keybinding to toggle terminal
        direction = 'float', -- Default terminal direction (can be 'float', 'horizontal', 'vertical', 'tab')
        size = 20, -- Default terminal size
      }

      -- Function to set terminal-specific key mappings
      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
      end

      -- Automatically set key mappings when a terminal opens
      vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

      -- Keybindings for specific terminal directions
      vim.api.nvim_set_keymap('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
    end,
  },
}
