-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Better visual indenting (keep visual selection)
map("v", "<", "<gv", { desc = "Indent left and keep selection" })
map("v", ">", ">gv", { desc = "Indent right and keep selection" })

-- Center cursor when scrolling or searching
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Prev search result and center" })

-- Paste without overwriting default register with replaced text
map("x", "<leader>p", '"_dP', { desc = "Paste without clobbering register" })

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })

-- AI Provider Switcher & Context-Aware Chat
map({ "n", "v" }, "<leader>aa", function()
  require("config.ai").toggle_chat()
end, { desc = "Toggle AI Chat (Copilot / Antigravity)" })

map("n", "<leader>aT", function()
  require("config.ai").select_mode()
end, { desc = "Switch AI Provider on the fly" })

map("n", "<leader>aA", function()
  require("config.ai").toggle_antigravity_float()
end, { desc = "Toggle Antigravity CLI Float" })

-- Toggle Copilot suggestion auto_trigger
map("n", "<leader>uC", function()
  require("copilot.suggestion").toggle_auto_trigger()
  local enabled = vim.b.copilot_suggestion_auto_trigger
  if enabled == nil then
    enabled = true
  end
  vim.notify("Copilot auto-trigger " .. (enabled and "enabled" or "disabled"))
end, { desc = "Toggle Copilot Auto-Trigger" })
