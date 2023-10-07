local lspconfig = require "lspconfig";

local cmp_nvim_lsp = require "cmp_nvim_lsp";

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    print("navic not installed");
    return
  end

  navic.attach(client, bufnr);
end

local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true }

  vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
  vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

  local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
  }

  -- To instead override globally
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>Telescope lsp_declarations<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float{border = 'rounded'}<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-f>", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

  attach_navic(client, bufnr);
end


local capabilities = cmp_nvim_lsp.default_capabilities();

local icons = require "bk201.ui.icons";
local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local opts = {};

for _, server in pairs(require "bk201.lsp.servers") do
  opts = {
    capabilities = capabilities,
    on_attach = on_attach
  };
  --
  if server == "lua_ls" then
    local l_status_ok, neodev = pcall(require, "neodev");
    if not l_status_ok then
      return
    end

    neodev.setup {};

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          hint = { enable = true }
        },
      },
    })
    goto continue
  end

  lspconfig[server].setup(opts);
  ::continue::
end


require "bk201.lsp.null-ls";
