return {
  -- General tooling
  {
    "tanvirtin/vgit.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = function()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
        { silent = true, noremap = true }
      )
      vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
        { silent = true, noremap = true }
      )
  end,
    opts = {
      position = "bottom",            -- position of the list can be: bottom, top, left, right
      height = 10,                    -- height of the trouble list when position is top or bottom
      width = 50,                     -- width of the list when position is left or right
      icons = true,                   -- use devicons for filenames
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      severity = nil,                 -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      fold_open = "",              -- icon used for open folds
      fold_closed = "",            -- icon used for closed folds
      group = true,                   -- group results by file
      padding = true,                 -- add an extra new line on top of the list
      cycle_results = true,           -- cycle item list when reaching beginning or end of list
      action_keys = {                 -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q",                     -- close the list
        cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r",                   -- manually refresh
        jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" },        -- open buffer in new split
        open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
        open_tab = { "<c-t>" },          -- open buffer in new tab
        jump_close = { "o" },            -- jump to the diagnostic and close the list
        toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s",           -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview = "P",            -- toggle auto_preview
        hover = "K",                     -- opens a small popup with the full multiline message
        preview = "p",                   -- preview the diagnostic location
        close_folds = { "zM", "zm" },    -- close all folds
        open_folds = { "zR", "zr" },     -- open all folds
        toggle_fold = { "zA", "za" },    -- toggle fold of current file
        previous = "k",                  -- previous item
        next = "j"                       -- next item
      },
      indent_lines = true,               -- add an indent guide below the fold icons
      auto_open = false,                 -- automatically open the list when you have diagnostics
      auto_close = false,                -- automatically close the list when you have no diagnostics
      auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false,                 -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    --dependencies = {"williamboman/mason.nvim"},
    event = "BufReadPre",
  },

  {
    "ms-jpq/coq_nvim",
    --priority = 1000,
    build = ":COQdeps",
    init = function()
      vim.g.coq_settings = {
        auto_start = true,
        keymap = {
          recommended = true,
        }
      }
    end
  },

  {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts',
    dependencies = {"ms-jpq/coq_nvim",},
    event = BufReadPre,
  },

  {
    'ms-jpq/coq.thirdparty',
    branch = '3p',
    dependencies = {"ms-jpq/coq_nvim",},
    event = BufReadPre,
  },

  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    config = true
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      {"williamboman/mason.nvim"}
    },
    config = function()
      local lsp = require('lspconfig')
      local coq = require('coq')

      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          lsp[server_name].setup(coq.lsp_ensure_capabilities())
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        --["haskell-language-server"] = function()
        --  coq.lsp_ensure_capabilities { require('haskell-tools').setup() }
        --end,
        ["rust_analyzer"] = function()
          local rt = require("rust-tools")
          coq.lsp_ensure_capabilities { rt.setup() }
        end,
        ["lua_ls"] = function()
          coq.lsp_ensure_capabilities {
            lsp.lua_ls.setup {
              settings = {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- Fix lua error
                    checkThirdParty = false,
                  },
                  -- Do not send telemetry data containing a randomized but unique identifier
                  telemetry = {
                    enable = false,
                  }}}}}
          end
       }
    end
  },

  { "ray-x/guihua.lua", run = "cd lua/fzy && make" },

  --{
  --  "ray-x/navigator.lua",
  --   dependecies = {
  --     { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  --     { "neovim/nvim-lspconfig" },
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  --   --config = true,
  --   opts = {
  --      mason = true,
  --   },
  -- },

  -- language support
  { "elm-tooling/elm-vim", ft = "elm" },
  { "rust-lang/rust.vim", ft = "rs", lazy = false},
  { "simrat39/rust-tools.nvim"},
  { "idris-hackers/idris-vim", ft = "idris"},
  { "plasticboy/vim-markdown", ft = "md" },
  { "ziglang/zig.vim", ft = "zig"},
  { "alker0/chezmoi.vim" },
  {
    "folke/neodev.nvim",
    config = true,
  },

  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.opt.conceallevel = 1
      vim.g.tex_conceal="abdmg"
    end
  },

  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
     "nvim-lua/plenary.nvim",
     "nvim-telescope/telescope.nvim", -- optional
    },
    branch = "1.x.x", -- recommended
    ft = "hs",
  },

  {
    "gluon-lang/vim-gluon",
  },
}
