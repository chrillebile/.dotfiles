local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
--  n = {
--      ["<leader>h"] = "",
--      ["<C-s>"] = ""
--  }
}

-- n = normal, i = insert and v = visual
M.default = {
  n = {
     ["<leader>q"] = {"<cmd> q <CR>", "Quit"}
  }
}

M.telescope = {
  n = {
    ["<leader>cc"] = {"<cmd> Telescope <CR>", "Open Telescope"}
  }
}

M.bufferline = {
  n = {
    ["<leader>1"] = {"<cmd> BufferLineGoToBuffer 1 <CR>", "Go to bufferline 1"},
    ["<leader>2"] = {"<cmd> BufferLineGoToBuffer 2 <CR>", "Go to bufferline 2"},
    ["<leader>3"] = {"<cmd> BufferLineGoToBuffer 3 <CR>", "Go to bufferline 3"},
    ["<leader>4"] = {"<cmd> BufferLineGoToBuffer 4 <CR>", "Go to bufferline 4"},
    ["<leader>5"] = {"<cmd> BufferLineGoToBuffer 5 <CR>", "Go to bufferline 5"},
    ["<leader>6"] = {"<cmd> BufferLineGoToBuffer 6 <CR>", "Go to bufferline 6"},
    ["<leader>7"] = {"<cmd> BufferLineGoToBuffer 7 <CR>", "Go to bufferline 7"},
    ["<leader>8"] = {"<cmd> BufferLineGoToBuffer 8 <CR>", "Go to bufferline 8"},
    ["<leader>9"] = {"<cmd> BufferLineGoToBuffer 9 <CR>", "Go to bufferline 9"},
  }
}

return M

