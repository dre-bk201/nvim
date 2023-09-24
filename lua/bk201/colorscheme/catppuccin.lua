-- local status_ok, catppuccin = pcall(require, "catppuccin");

-- if not status_ok then
--   print("unable to load catppuccin-theme");
--   return
-- end

-- catppuccin.setup({
--   transparent_background = true,
--   term_colors = true,
--   compile = {
--     enabled = false,
--     path = vim.fn.stdpath("cache") .. "/catppuccin",
--   },
--   dim_inactive = {
--     enabled = false,
--     shade = "dark",
--     percentage = 0.15,
--   },
--   no_italic = true,
--   styles = {
--     comments = { "italic" },
--     conditionals = {},
--     loops = {},
--     functions = {},
--     keywords = {},
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--   },
--   integrations = {
--     treesitter = true,
--     cmp = true,
--     gitsigns = true,
--     telescope = true,
--     nvimtree = true,
--     which_key = true,
--     notify = true,
--     fidget = true,
--     navic = {
--       enabled = true,
--       custom_bg = "NONE",
--     },
--     indent_blankline = {
--       enabled = true,
--     }
--     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--   },
--   color_overrides = {},
--   highlight_overrides = {},
-- });

return {
  transparent_background = true,
  term_colors = true,
  compile = {
    enabled = false,
    path = vim.fn.stdpath("cache") .. "/catppuccin",
  },
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = true,
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    which_key = true,
    notify = true,
    fidget = true,
    navic = {
      enabled = true,
      custom_bg = "NONE",
    },
    indent_blankline = {
      enabled = true,
    }
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
  color_overrides = {},
  highlight_overrides = {},
};
