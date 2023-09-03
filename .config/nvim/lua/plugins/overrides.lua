return {
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", enabled = false },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        window = {
          width = 30,
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      timeout = 300,
    },
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
}
