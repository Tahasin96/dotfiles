return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      auto_update        = true,
      neovim_image_text  = "Arch Linux",        -- Hover text for small image
      main_image         = "file",              -- Large image will match file type
      small_image        = "neovim",            -- Small image always Neovim icon
      small_image_text   = "Arch Linux",        -- Hover text for small image
      show_time          = true,
      editing_text       = "Editing %s",
      file_explorer_text = "Browsing %s",
    })
  end
}
