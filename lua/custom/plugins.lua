local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "go", "lua", "python" },
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },

    opts = function()
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      opts = function()
        return require "custom.configs.treesitter"
      end,

      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChadnvim-colorizer.lua",
  --   enabled = true,
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    ft = "go",
    config = function()
      require "custom.configs.dap-go"
    end,
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  -- },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      require "custom.configs.dap-pyright"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "echasnovski/mini.indentscope",
    ft = { "python", "go", "lua" },
    config = function()
      -- require "custom.mini_indentscope"
      require("mini.indentscope").setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   config = function()
  --     require("nvim-highlight-colors").setup {
  --       render = "background", -- or 'foreground' or 'first_column'
  --       enable_named_colors = true,
  --       enable_tailwind = false,
  --       custom_colors = {
  --         -- label property will be used as a pattern initially(string.gmatch), therefore you need to escape the special characters by yourself with %
  --         { label = "%-%-theme%-font%-color", color = "#fff" },
  --         { label = "%-%-theme%-background%-color", color = "red" },
  --         { label = "%-%-theme%-primary%-color", color = "#0f1219" },
  --         { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
  --         { label = "%-%-theme%-contrast%-color", color = "#fff" },
  --         { label = "%-%-theme%-accent%-color", color = "#55678e" },
  --       },
  --     }
  --   end,
  -- },

  {
    "stevearc/aerial.nvim",
    opts = {},

    ft = { "python", "go", "lua" },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup {
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>ol", "<cmd>AerialToggle!<CR>")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    opts = function()
      require("project_nvim").setup {}
      require("telescope").load_extension "cmdline"
      -- require("projects.nvim").setup {}
      require("telescope").load_extension "projects"

      require("telescope").load_extension "persisted"
      -- require("telescope").extensions.projects.projects {}
    end,
    dependencies = {
      "ahmedkhalf/project.nvim",
      "jonarrien/telescope-cmdline.nvim",
      -- Lua
      {
        "olimorris/persisted.nvim",
        config = function()
          require("persisted").setup {
            autoload = false,
          }
        end,
      },
    },
    keys = {
      { "<leader><leader>", "<cmd>Telescope cmdline<cr>", desc = "Cmdline" },
      { "<leader>pl", "<cmd>Telescope projects<cr>", desc = "list recent projects" },
    },
  },

  {
    "ThePrimeagen/vim-be-good",
  },
}

return plugins
