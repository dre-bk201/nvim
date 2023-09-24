-- https://github.com/pedro757/emmet
-- npm i -g ls_emmet
local is_win = require "bk201.functions".is_windows()
local lsp_server = is_win and "ls_emmet.cmd" or "ls_emmet"

return {
  cmd = { lsp_server, "--stdio" },
  filetypes = {
    "html",
    "vue",
    "svelte",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "haml",
    "xml",
    "xsl",
    "pug",
    "slim",
    "sass",
    "stylus",
    "less",
    "sss",
    "hbs",
    "handlebars",
  },
}
