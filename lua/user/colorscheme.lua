vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup()

vim.cmd [[
try
  colorscheme catppuccin
  " set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
