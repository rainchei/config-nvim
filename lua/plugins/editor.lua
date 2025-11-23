return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        -- disable fuzzy finder
        ["/"] = "noop",
      },
    },
    filesystem = {
      filtered_items = {
        hide_gitignored = true,
        hide_by_pattern = {
          "*.uid",
          "server.pipe",
        },
        visible = false,
      },
    },
  },
}
