return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  cmd = "CopilotChat",
  opts = function(_, opts)
    local user = vim.env.USER or "User"
    user = user:sub(1, 1):upper() .. user:sub(2)

    opts = opts or {}
    opts.model = opts.model or "gpt-4o"
    opts.auto_insert_mode = true
    opts.show_help = true
    opts.headers = {
      user = "  " .. user .. " ",
      assistant = "  Copilot ",
      tool = "󰊳  Tool ",
    }
    opts.window = opts.window or {}
    opts.window.width = 0.4
    opts.selection = function(source)
      local select = require("CopilotChat.select")
      return select.visual(source) or select.buffer(source)
    end
    return opts
  end,
  keys = {
    { "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain Code", mode = { "n", "v" } },
    { "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "Generate Tests", mode = { "n", "v" } },
    { "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix Code / Diagnostics", mode = { "n", "v" } },
    { "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review Code", mode = { "n", "v" } },
    { "<leader>ad", "<cmd>CopilotChatDocs<cr>", desc = "Generate Docs", mode = { "n", "v" } },
    { "<leader>ao", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize Code", mode = { "n", "v" } },
    { "<leader>am", "<cmd>CopilotChatCommit<cr>", desc = "Generate Commit Message", mode = "n" },
    { "<leader>aM", "<cmd>CopilotChatModels<cr>", desc = "Select AI Model", mode = "n" },
  },
}
