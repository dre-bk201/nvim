local alpha = require "alpha";

local is_win = require "bk201.functions".is_windows();

-- local btn = is_win and button("c", icons.ui.Gear .. " Config", ":e ~/AppData/Local/nvim/init.lua <CR>") or
--     button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>")

local dashboard = require "alpha.themes.dashboard";

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

local icons = require "bk201.ui.icons";

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
  button("e", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
  button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
  button("t", icons.ui.List .. " Find text", ":Telescope live_grep <CR>"),
  -- dashboard.button("s", icons.ui.SignIn .. " Find Session", ":silent Autosession search <CR>"),
  button("s", icons.ui.SignIn .. " Find Session", ":SearchSession<CR>"),
  is_win and button("c", icons.ui.Gear .. " Config", ":e C:/Users/$USER/AppData/Local/nvim/init.lua <CR>") or
  button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("u", icons.ui.CloudDownload .. " Update", ":PackerSync<CR>"),
  button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}
local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return "Bk-201"
end

dashboard.section.footer.val = footer()

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Macro"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts);
