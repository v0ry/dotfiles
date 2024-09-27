# Setting options


---
- Why does `vim.opt.clipboard = { "unnamed", "unnamedplus" } -- vim.api.nvim_set_option("clipboard", "unnamed")` work and `vim.g.clipboard = { "unnamed", "unnamedplus" }` **not work?**
	- `vim.g` is used to set global variables, but clipboard is an `option` in Neovim. 