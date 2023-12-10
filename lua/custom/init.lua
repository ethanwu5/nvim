-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "init.lua" },
  command = "source %",
  group = vim.api.nvim_create_augroup("SourceGroup", { clear = true }),
})
-- vim.notify("hhhhh", vim.log.levels.DEBUG)
--  获取当前窗口buf
local bufn = vim.api.nvim_get_current_buf()
-- print(bufn)

local datas = vim.api.nvim_buf_get_lines(bufn, 0, -1, true)

-- local newbuf = vim.api.nvim_create_buf(true, true)

--vim.api.nvim_buf_set_lines(57, 0, -1, true, datas)
-- vim.api.nvim_set_hl(0, "Cursorline", {
--   bg = "#010f20",
--   fg = "#ffffff",
--   bold = true,
-- })

vim.opt.relativenumber = true
