return {
  -- Syntax Highlighting
  { "habamax/vim-godot" },
  -- -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gdscript = { "gdscript_formatter" },
      },
      formatters = {
        gdscript_formatter = {
          command = "gdscript-formatter",
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
  -- Linter
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        gdscript = { "gdscript_lint" },
      },
      linters = {
        gdscript_lint = {
          cmd = "gdscript-formatter",
          stdin = false,
          args = { "lint", "$FILENAME" },
          stream = "stdout",
          ignore_exitcode = true,

          parser = function(output)
            local diagnostics = {}

            -- file:line:code:severity: message
            for _, line, code, severity, msg in output:gmatch("([^:]+):(%d+):([^:]+):([^:]+):%s*([^\n]+)") do
              table.insert(diagnostics, {
                lnum = tonumber(line) - 1,
                col = 0,
                message = "[" .. code .. "] " .. msg,
                source = "gdscript-formatter",
                severity = ({
                  error = vim.diagnostic.severity.ERROR,
                  warning = vim.diagnostic.severity.WARN,
                  info = vim.diagnostic.severity.INFO,
                  hint = vim.diagnostic.severity.HINT,
                })[severity] or vim.diagnostic.severity.ERROR,
              })
            end

            return diagnostics
          end,
        },
      },
    },
  },
  -- GodotDoc
  {
    "teatek/gdscript-extended-lsp.nvim",
    opts = {
      picker = "snacks",
    },
  },
}
