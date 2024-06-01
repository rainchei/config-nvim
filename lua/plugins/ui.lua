return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
         .d8888b.  888                                               8888888 88888888888 
        d88P  Y88b 888                                                 888       888     
        888    888 888                                                 888       888     
        888        88888b.   8888b.  88888b.   .d88b.   .d88b.         888       888     
        888        888 "88b     "88b 888 "88b d88P"88b d8P  Y8b        888       888     
        888    888 888  888 .d888888 888  888 888  888 88888888        888       888     
        Y88b  d88P 888  888 888  888 888  888 Y88b 888 Y8b.            888       888     
         "Y8888P"  888  888 "Y888888 888  888  "Y88888  "Y8888       8888888     888     
                                                   888                                   
                                              Y8b d88P                                   
                                               "Y88P"                                    
      ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
