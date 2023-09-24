local colorscheme = "catppuccin";

require("bk201.colorscheme.github-theme");
require("bk201.colorscheme.fleet");
require("bk201.colorscheme.ayu");
require("bk201.colorscheme.nightfox");
-- require("bk201.colorscheme.catppuccin");

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme);

if not status_ok then
  return
end
