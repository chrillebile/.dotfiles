local M = {}

local state_file = vim.fn.stdpath("state") .. "/ai_mode.txt"

---Get current AI mode ('copilot' or 'antigravity')
function M.get_mode()
  if vim.g.ai_mode then
    return vim.g.ai_mode
  end

  -- 1. Check environment variable (e.g. export NVIM_AI="antigravity" in shell)
  if vim.env.NVIM_AI and (vim.env.NVIM_AI == "copilot" or vim.env.NVIM_AI == "antigravity") then
    vim.g.ai_mode = vim.env.NVIM_AI
    return vim.g.ai_mode
  end

  -- 2. Check uncommitted local file (lua/config/local.lua)
  local has_local, local_cfg = pcall(require, "config.local")
  if has_local and type(local_cfg) == "table" and local_cfg.ai_mode then
    vim.g.ai_mode = local_cfg.ai_mode
    return vim.g.ai_mode
  end

  -- 3. Check persistent machine state
  local f = io.open(state_file, "r")
  if f then
    local mode = f:read("*l")
    f:close()
    if mode == "copilot" or mode == "antigravity" then
      vim.g.ai_mode = mode
      return vim.g.ai_mode
    end
  end

  -- 4. Default fallback: work mode (copilot)
  vim.g.ai_mode = "copilot"
  return vim.g.ai_mode
end

---Switch AI mode dynamically on the fly
---@param mode "copilot" | "antigravity"
---@param silent? boolean
function M.set_mode(mode, silent)
  mode = (mode or ""):lower()
  if mode ~= "copilot" and mode ~= "antigravity" then
    vim.notify("Invalid AI mode: '" .. tostring(mode) .. "'. Choose 'copilot' or 'antigravity'", vim.log.levels.ERROR)
    return
  end

  vim.g.ai_mode = mode

  -- Persist choice to local machine state (survives restarts)
  local f = io.open(state_file, "w")
  if f then
    f:write(mode .. "\n")
    f:close()
  end

  -- Apply runtime changes to Copilot
  if mode == "copilot" then
    pcall(function()
      vim.cmd("Copilot enable")
      require("copilot.suggestion").toggle_auto_trigger(true)
    end)
    if not silent then
      vim.notify("AI Mode:  Copilot (Work) enabled", vim.log.levels.INFO, { title = "AI Provider" })
    end
  else
    pcall(function()
      vim.cmd("Copilot disable")
      require("copilot.suggestion").toggle_auto_trigger(false)
    end)
    if not silent then
      vim.notify("AI Mode: 🚀 Antigravity (Private) enabled", vim.log.levels.INFO, { title = "AI Provider" })
    end
  end
end

---Toggle between Copilot and Antigravity
function M.toggle_mode()
  local current = M.get_mode()
  local next_mode = (current == "copilot") and "antigravity" or "copilot"
  M.set_mode(next_mode)
end

---Interactive picker to switch mode on the fly
function M.select_mode()
  local current = M.get_mode()
  local options = {
    { id = "copilot", label = "  Copilot (Work Mode)" },
    { id = "antigravity", label = "🚀 Antigravity (Private Mode)" },
  }

  vim.ui.select(options, {
    prompt = "Select AI Provider (Current: " .. current .. "):",
    format_item = function(item)
      local active = (item.id == current) and " [ACTIVE]" or ""
      return item.label .. active
    end,
  }, function(choice)
    if choice then
      M.set_mode(choice.id)
    end
  end)
end

---Primary toggle action (<leader>aa): launches CopilotChat or Antigravity CLI
function M.toggle_chat()
  local mode = M.get_mode()
  if mode == "antigravity" then
    Snacks.terminal.toggle("agy", {
      win = {
        position = "right",
        width = 0.45,
      },
      env = {
        TERM = "xterm-256color",
      },
    })
  else
    local ok, chat = pcall(require, "CopilotChat")
    if ok then
      chat.toggle()
    else
      vim.notify("CopilotChat not available", vim.log.levels.WARN)
    end
  end
end

---Floating Antigravity CLI terminal (<leader>aA)
function M.toggle_antigravity_float()
  Snacks.terminal.toggle("agy", {
    win = {
      position = "float",
      width = 0.85,
      height = 0.85,
      border = "rounded",
    },
    env = {
      TERM = "xterm-256color",
    },
  })
end

-- Setup user commands
vim.api.nvim_create_user_command("SetAIMode", function(opts)
  local arg = vim.trim(opts.args or "")
  if arg == "" then
    M.select_mode()
  else
    M.set_mode(arg)
  end
end, {
  nargs = "?",
  complete = function()
    return { "copilot", "antigravity" }
  end,
  desc = "Switch AI mode ('copilot' or 'antigravity')",
})

vim.api.nvim_create_user_command("ToggleAIMode", function()
  M.toggle_mode()
end, {
  desc = "Toggle between Copilot and Antigravity",
})

return M
