local mason = require "mason";
local mason_lspconfig = require "mason-lspconfig";

mason.setup {
    ui = {
        border = "rounded",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    max_concurrent_installers = 4,
};

mason_lspconfig.setup {
    ensure_installed = require "bk201.lsp.servers",
    automatic_installation = true,
}
