return {
  "git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git",
  -- Activate when a file is created/opened
  event = { "BufReadPre", "BufNewFile" },
  -- Activate when a supported filetype is open
  ft = { "go", "javascript", "python", "ruby" },
  cond = function()
    -- Only activate if token is present in environment variable.
    if vim.env.GITLAB_TOKEN == nil or vim.env.GITLAB_TOKEN == "" then
      -- Show a warning if the token is not set
      vim.notify("Warning: GITLAB_TOKEN is not set. GitLab plugin will not activate.", vim.log.levels.WARN)
      return false
    end
    return true
  end,
  opts = {
    statusline = {
      -- Hook into the built-in statusline to indicate the status
      -- of the GitLab Duo Code Suggestions integration
      enabled = true,
    },
  },
}
