return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    opts = {
      servers = {
        eslint = {
          filetypes_include = { "templ" },
        },
        html = {
          filetypes_include = { "templ" },
        },
        javascript = {
          filetypes_include = { "templ" },
        },
        cssls = {
          filetypes_include = { "templ" },
        },
        htmx = {
          filetypes_include = { "templ", "html" },
          init_options = {
            userLanguages = {
              templ = "html",
            },
          },
        },
        tailwindcss = {
          -- exclude a filetype from the default_config
          filetypes_exclude = { "markdown" },
          -- add additional filetypes to the default_config
          filetypes_include = { "templ" },
          -- to fully override the default_config, change the below
          -- filetypes = {}
          init_options = {
            userLanguages = {
              templ = "html",
            },
          },
        },
        templ = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
      init_options = {
        --- @type table<string, any> https://docs.emmet.io/customization/preferences/
        preferences = {},
        --- @type "always" | "never" defaults to `"always"`
        howexpandedabbreviation = "always",
        --- @type boolean defaults to `true`
        showabbreviationsuggestions = true,
        --- @type boolean defaults to `false`
        showsuggestionsassnippets = false,
        --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
        syntaxprofiles = {},
        --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
        variables = {},
        --- @type string[]
        excludelanguages = {},
      },
    },
  },
}
