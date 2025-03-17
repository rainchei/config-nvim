return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      -- Define custom <CR> actions
      local select_one_or_multi = function(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()

        if not vim.tbl_isempty(multi) then
          actions.close(prompt_bufnr)
          for _, entry in pairs(multi) do
            local path = entry.path or entry.value -- fallback if .path is nil
            if path then
              vim.cmd(string.format("edit %s", vim.fn.fnameescape(path)))
            end
          end
        else
          actions.select_default(prompt_bufnr)
        end
      end

      -- Merge options with the custom mappings
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<CR>"] = select_one_or_multi,
          },
          n = {
            ["<CR>"] = select_one_or_multi,
          },
        },
      })

      -- Return opts to verify or extend elsewhere
      return opts
    end,
  },
}
