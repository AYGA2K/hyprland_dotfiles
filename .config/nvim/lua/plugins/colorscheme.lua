return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
      },
      on_colors = function(colors)
        colors.bg = "#11121D"
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
    },
    lazy = true,
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  {
    colorscheme = "tokyonight-night",
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
      transparent_background = true,
    },
    lazy = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}
