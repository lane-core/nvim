return {
  -- themes
  {
    "mswift42/vim-themes",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("Greymatters")
    end,
  },

  {
    "savq/melange-nvim",
    lazy = false,
    priority = 1000,
  },

  -- quality of life
  {
    "Shatur/neovim-session-manager",
    lazy = false,
    dependencies = "nvim-lua/plenary.nvim",
  },

  { "echasnovski/mini.ai", lazy = false, version = false, config = true },
  { "echasnovski/mini.align", lazy = false, version = false, config = true },
  --{ "echasnovski/mini.animate", lazy = false, version = false, config = true },
  { "echasnovski/mini.basics", lazy = false, version = false, config = true },
  --{ "echasnovski/mini.bufremove", lazy = false, version = false, config = true },
  { "echasnovski/mini.completion", lazy = false, version = false, config = true },
  { "echasnovski/mini.comment", lazy = false, version = false, config = true },
  { "echasnovski/mini.hipatterns", lazy = false, version = false, config = true },
  { "echasnovski/mini.indentscope", lazy = false, version = false, config = true },
  { "echasnovski/mini.pairs", lazy = false, version = false, config = true },
  { "echasnovski/mini.surround", lazy = false, version = false, config = true },
  --{ "echasnovski/mini.tabline", lazy = false, version = false, lazy = false, config = true },

  -- ui
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzy-native.nvim"},
    },
    config = function()
      require('telescope').load_extension('fzy_native')
    end
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      fps = 60,
      timeout = 1250,
    },
  },

  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,       -- add a border to hover docs and signature help
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    event = "BufRead",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = { diagnostics = "nvim_lsp", },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = true,
  },

  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end
  },

  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --opts = { require'alpha.themes.startify'.config },
  },

  --{
  --  "kylechui/nvim-surround",
  --  --tag = "*", -- for stability; omit to `main` branch for the latest features
  --  config = true,
  --},

  {
    "folke/which-key.nvim",
    lazy = false,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- utilities
  {
  "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    keys = {
      {"<c-cr>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal"},
    },
    version = "*",
    config = true,
  },
}
