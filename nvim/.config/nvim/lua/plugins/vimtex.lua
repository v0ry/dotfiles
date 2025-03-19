return {
  {
    'lervag/vimtex',
    lazy = false,
    config = function()
      vim.g.tex_flavor = 'latex' -- Default tex file format
      vim.g.vimtex_quickfix_mode = 2 -- Open quickfix window on error
      vim.g.vimtex_compiler_latexmk_engines = { ['_'] = '-lualatex -shell-escape' } -- Use lualatex
      vim.g.vimtex_indent_on_ampersands = 0 -- Don't indent on ampersands
      vim.g.vimtex_view_method = 'sioyek' -- Use sioyek for pdf viewing
      -- vim.g.vimtex_view_skim_sync = 1 -- Value 1 allows forward search after every successful compilation
      -- vim.g.vimtex_view_skim_activate = 1 -- Value 1 allows change focus to skim after command `:VimtexView` is given
      vim.g.matchup_override_vimtex = 1 -- Use vimtex for matching
    end,
  },
}
