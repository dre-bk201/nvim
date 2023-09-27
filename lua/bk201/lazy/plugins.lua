local colorschemes = {
  { "projekt0n/github-nvim-theme" },
  { "rebelot/kanagawa.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "kartikp10/noctis.nvim" },
  { "felipeagc/fleet-theme-nvim" },
  { "Shatur/neovim-ayu" },
  { "EdenEast/nightfox.nvim" },
  { "AhmedAbdulrahman/aylin.vim" },
  { "kartikp10/noctis.nvim",           dependencies = { "rktjmp/lush.nvim" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = require "bk201.colorscheme.catppuccin",
  }
};

local ai = {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }
};

local file_browser = {
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    commit = "cbb5313f9044a2ccf0b3e0f85a9e6a4e0fd0dd40",
    config = function() require "bk201.config.nvim-tree" end
  },
};

local keybinding = {
  {
    "folke/which-key.nvim",
    config = function() require "bk201.config.whichkey" end
  }
};

local buffer = {
  { "moll/vim-bbye", cmd = "Bdelete" },
};

local terminal = {
  {
    "akinsho/toggleterm.nvim",
    config = function() require "bk201.config.toggleterm" end,
  },
};

local ui = {
  {
    "goolord/alpha-nvim",
    config = function() require "bk201.config.alpha" end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function() require "bk201.config.neoscroll" end
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = require "bk201.opts.nvim-colorizer"
  },
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    opts = require "bk201.opts.navic",
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = require "bk201.opts.fidget",
    version = "legacy",
  },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   -- opts = require "bk201.opts.noice",
  --   config = function() require "bk201.config.noice" end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- }
};

local lsp = {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function() require "bk201.lsp.lspconfig" end
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    },
    config = function() require "bk201.lsp.mason" end
  },
};

local icons = {
  { "kyazdani42/nvim-web-devicons" },
};

local core = {
  {
    "nvim-lua/plenary.nvim",
    commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7",
  },
  {
    "nvim-lua/popup.nvim",
    commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
  },
};

local completion = {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function() require "bk201.cmp" end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function() require "bk201.config.autopairs" end
  },
};

local comment = {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "folke/todo-comments.nvim",
        opts = require "bk201.opts.todo-comment",
      },
    },
    config = function() require "bk201.config.comment" end
  },
};

local editing_support = {
  { "kylechui/nvim-surround" }, -- consider installing this
  { "windwp/nvim-ts-autotag" },
  { "folke/neodev.nvim" },      -- lsp support to neovim modules
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function() require "bk201.config.treesitter" end
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function() require "bk201.config.telescope" end
  },
  { "simrat39/rust-tools.nvim", ft = { "rs" } },
  {
    "Saecki/crates.nvim",
    ft = "toml",
    opts = require "bk201.opts.crates",
  },
  { "folke/trouble.nvim",       cmd = { "Trouble", "TroubleToggle" } },
};

return {
  ui,
  ai,
  lsp,
  core,
  icons,
  buffer,
  comment,
  terminal,
  completion,
  keybinding,
  colorschemes,
  file_browser,
  editing_support,
}
