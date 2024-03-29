local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- diagnostics.eslint_d,
    formatting.prettierd,
    -- formatting.eslint_d,
    diagnostics.eslint,
    -- formatting.eslint,
    -- formatting.prettier,
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    --[[ formatting.black.with({ extra_args = { "--fast" } }), ]]
    --[[ formatting.sumneko_lua, ]]
    -- diagnostics.sumneko_lua,
    -- formatting.stylua,
    -- diagnostics.flake8
  },
})
