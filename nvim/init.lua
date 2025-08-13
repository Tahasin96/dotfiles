-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Map Ctrl-a to select all in normal mode
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Map Ctrl-c to copy selection to system clipboard in visual mode
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy selection to clipboard" })
