return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = function(_, opts)
      opts = opts or {}
      local is_copilot = (vim.g.ai_mode or "copilot") == "copilot"
      opts.suggestion = {
        enabled = is_copilot,
        auto_trigger = is_copilot,
        keymap = {
          accept = false, -- Handled by <Tab> via LazyVim / blink.cmp
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      }
      opts.panel = { enabled = false }
      opts.filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        ["*"] = true,
      }
      return opts
    end,
  },
}
