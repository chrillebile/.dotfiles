local M = {}

M.treesitter = {
    ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "markdown",
        "bash",
        "lua",
        "typescript",
    },
}

M.nvimtree = {
    git = {
        enable = true,
    },
}

return M
