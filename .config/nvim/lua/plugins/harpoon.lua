local plugin = "harpoon"

return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  opts = function(_, opts)
    opts.global_settings = {
      save_on_toggle = true,
      save_on_change = true,
      enter_on_sendcmd = false,
      tmux_autoclose_windows = false,
      excluded_filetypes = { plugin, "alpha", "dashboard", "gitcommit" },
      mark_branch = true,
      tabline = false,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    }
  end,

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configure harpoon.

  config = function(_, opts)
    require(plugin).setup(opts)
    local mark = require(plugin .. ".mark")
    local ui = require(plugin .. ".ui")
    -- Harpoon next and previous.
    vim.keymap.set("n", "<C-S-Left>", function()
      ui.nav_prev()
    end)
    vim.keymap.set("n", "<C-S-Right>", function()
      ui.nav_next()
    end)

    -- Harpoon user interface.
    vim.keymap.set("n", "<C-S-Up>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<C-S-Down>", mark.add_file)
  end,
}
