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
    ["<leader>pl"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", "show projcet list" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<leader>q"] = { "<cmd>q!<CR>", "quit current window" },
    ["<C-s>"] = { "<cmd>w!<CR>", "save current file" },
    ["<leader>pl"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", "show projcet list" },
  },
  t = {
    ["<leader>q"] = { "<cmd>q!<CR>", "quit current window" },
    ["<leader>pl"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", "show projcet list" },
  },
  i = {
    ["<C-s>"] = { "<cmd>w!<CR>", "save current file" },
    ["<leader>pl"] = { "<cmd>lua require'telescope'.extensions.projects.projects{}<CR>", "show projcet list" },
  },
}

-- more keybinds!

return M
