---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q!<CR>", "quit current window" },
    ["<C-s>"] = { "<cmd>w!<CR>", "save current file" },
    -- ['<Leader>b', function() require('dap').toggle_breakpoint() end)]
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>", "toggle_breakpoint" },
    ["<leader>dr"] = { ":lua require('dap').continue()<CR>", "toggle_breakpoint" },
    ["<leader>dn"] = { ":lua require('dap').step_over()<CR>", "toggle_breakpoint" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    -- ["<C-s>"] = { "<cmd>w!<CR>", "save current file" },
  },
  t = {
    ["<leader>q"] = { "<cmd>q!<CR>", "quit current window" },
  },
  i = {
    ["<C-s>"] = { "<cmd>w!<CR>", "save current file" },
    -- ["<leader>pl"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", "show projcet list" },
  },
}

-- more keybinds!

return M
