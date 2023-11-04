return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        window = {
          width = 33,
        },
      },
    },
  },
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      timeout = 300,
    },
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
}
