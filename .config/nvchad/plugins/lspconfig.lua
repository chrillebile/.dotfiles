
local M = {}

M.setup_lsp = function(attach, capabilities)
   require("nvim-lsp-installer").setup {}

   local lspconfig = require("lspconfig")
end

return M

