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
map("n", "<C-Left>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--clipboard
map("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
map("v", "<C-x>", '"+d', { desc = "Cut to system clipboard" })
map("v", "D", '"_d', { desc = "Delete" })
map("n", "DD", '"_dd', { desc = "Delete line" })
-- scroll
--map("n", "<C-Up>", "<ScrollWheelUp>", { desc = "Scroll top" })
--map("n", "<C-Down>", "<ScrollWheelDown>", { desc = "Scroll top" })
map("n", "vv", "<C-v>", { desc = "V-Block" })
map("n", "vvv", "<S-v>", { desc = "V-Line" })
-- exit esc or C-[
map("i", "<S-x>", "<Esc>", { desc = "esc" })
-- buffers
-- if Util.has("bufferline.nvim") then
--   map("n", "<C-S-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
--   map("n", "<C-S-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- else
--   map("n", "<C-S-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
--   map("n", "<C-S-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- end
