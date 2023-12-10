---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nightowl",
  theme_toggle = { "onedark", "nightowl" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "vscode_colored",
    separator_style = "arrow",
  },
  changed_themes = {
    nightowl = {
      base_30 = {
        darker_black = "#011627",
      },
    },
  },
  nvdash = {
    load_on_startup = true,

    header = {
      "               ▄ ▄                       ",
      "           ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄         ",
      "           █ ▄ █▄█ ▄▄▄ █ █▄█ █ █         ",
      "        ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █         ",
      "      ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄      ",
      "      █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄    ",
      "    ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █    ",
      "    █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █    ",
      "        █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█        ",
    },
    buttons = {
      { "  Last Open", "Spc p l", "SessionLoad" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
