return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- Disable go.nvim internal LSP and formatting so it doesn't conflict
      -- with LazyVim's official gopls + conform.nvim pipeline
      lsp_cfg = false,
      lsp_gofumpt = false,
      lsp_inlay_hints = { enable = false },
    },
    config = function(_, opts)
      require("go").setup(opts)
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
