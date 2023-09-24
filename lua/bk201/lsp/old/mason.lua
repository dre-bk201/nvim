local status_ok, mason = pcall(require, "mason");

if not status_ok then
	return
end

local mason_lspconfig = require("mason-lspconfig");

local servers = {
  "pyright",
	"cssls",
	"volar",
	"cssmodules_ls",
	"emmet_ls",
	"html",
	"jsonls",
	"tsserver",
	"yamlls",
	"bashls",
	"clangd",
  "rust_analyzer",
	"tailwindcss",
  "taplo",
  "lua_ls",
  "zls",
};

local settings = {
	ui = {
		border = "rounded",
	  icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
};

mason.setup(settings);
mason_lspconfig.setup({
  ensure_installed = servers,
	automatic_installation = true,
});

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig");
if not lspconfig_status_ok then
	return
end


local opts = {};

for _, server in pairs(servers) do
	opts = {
		on_attach = require("bk201.lsp.handlers").on_attach,
		capabilities = require("bk201.lsp.handlers").capabilities,
	};

	-- server = vim.split(server, "@")[1]
	if server == "yamlls" then
		local yamlls_opts = require("bk201.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	if server == "lua_ls" then
		local l_status_ok, neodev = pcall(require, "neodev")
		if not l_status_ok then
			return
		end

		neodev.setup({})

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
		goto continue
	end

	if server == "tsserver" then
		local tsserver_opts = require("bk201.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server == "volar" then
		local volar_opts = {
			filetypes = { "vue"  },
			init_options = {
				typescript = {
					tsdk = "C:/Program Files/nodejs/node_modules/typescript/lib",
					-- tsdk = "C:/Program Files/nodejs"
				},
			},
		}
    opts = vim.tbl_deep_extend("force", volar_opts, opts)
		-- goto continue
	end

	if server == "pyright" then
		local pyright_opts = require("bk201.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "solc" then
		local solc_opts = require("bk201.lsp.settings.solc")
		opts = vim.tbl_deep_extend("force", solc_opts, opts)
	end

	if server == "emmet_ls" then
		local emmet_ls_opts = require("bk201.lsp.settings.emmet_ls")
		opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
	end

	if server == "jdtls" then
		goto continue
	end

	if server == "rust_analyzer" then
		local rust_opts = require("bk201.lsp.settings.rust")
		-- opts = vim.tbl_deep_extend("force", rust_opts, opts)
		local rust_tools_status_ok, rust_tools = pcall(require, "rust-tools")
		if not rust_tools_status_ok then
			return
		end

		rust_tools.setup(rust_opts)
		goto continue
	end

	lspconfig[server].setup(opts)
	::continue::
end
