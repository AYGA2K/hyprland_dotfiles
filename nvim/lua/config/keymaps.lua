-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
map("n", "<C-n>", "<cmd>RunCode<cr>", { desc = "Run Code" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- remap the g -jk keys to just jk to navigate between wrapped lines
map("n", "j", "gj", { desc = "Move down" })
map("n", "k", "gk", { desc = "Move up" })
--clipboard
-- map("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
-- map("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
map("v", "D", '"_d', { desc = "Delete" })
map("n", "DD", '"_dd', { desc = "Delete line" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<C-S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<C-S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  -- else
  --   map("n", "<C-S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  --   map("n", "<C-S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
