return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- load this before all the other plugins
    ---@class CatppuccinOptions
    opts = {
      flavour = "mocha",
    },
  },
}
