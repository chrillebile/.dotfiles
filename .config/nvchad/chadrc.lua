-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

M.mappings = require "custom.mappings"

M.ui = {
   theme = "gruvchad",
}

-- Install plugins
local userPlugins = require "custom.plugins"
local plugin_conf = require "custom.plugins.configs"

M.plugins = {
  user = userPlugins,
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = plugin_conf.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = plugin_conf.treesitter,
  },
}

return M
