local M = {}

function M.cowboy()
  ---@type table?
  local id
  local ok = true

  -- List of keys to monitor
  local keys = { "h", "j", "k", "l", "+", "-" }

  -- Function to handle key press
  local function handle_key_press(key)
    local count = 0
    local timer = vim.loop.new_timer()

    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0 -- Reset count if a count prefix is used
      end
      if count >= 10 then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🐮",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return key
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return key
      end
    end, { expr = true, silent = true })
  end

  -- Set up key mappings for each key
  for _, key in ipairs(keys) do
    handle_key_press(key)
  end
end

return M
