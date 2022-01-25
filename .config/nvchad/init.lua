-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local map = require("core.utils").map

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")

-- Install plugins
local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
   use {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
   }

   use {
      "williamboman/nvim-lsp-installer",
      --further packer options
   }

   use {
     "nvim-telescope/telescope-media-files.nvim",
   }
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
