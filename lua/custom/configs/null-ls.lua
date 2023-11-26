local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,

  -- go format
  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
}

-- autoformat
local group = vim.api.nvim_create_augroup("AutoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function()
    vim.lsp.buf.format()
    print "format ...."
  end,
})

null_ls.setup {
  debug = true,
  sources = sources,
}
