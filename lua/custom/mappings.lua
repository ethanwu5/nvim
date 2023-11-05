---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-q>"]= {"<cmd>q<CR>","quit current window"},
    -- ['<Leader>b', function() require('dap').toggle_breakpoint() end)]
    ["<leader>db"] = {":lua require('dap').toggle_breakpoint()<CR>","toggle_breakpoint"},
    ["<leader>dr"] = {":lua require('dap').continue()<CR>","toggle_breakpoint"},
    ["<leader>dn"] = {":lua require('dap').step_over()<CR>","toggle_breakpoint"},

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
