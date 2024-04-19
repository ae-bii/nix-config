-- File: plugins/telescope.lua
-- Description: nvim-telescope config
return {{
    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time.
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' }
    }},
    config = function()
        local opts = {
          extensions = {
            file_brwoser = {
              respect_gitignore = false,
              hijack_netrw = true,
              hidden = true,
            }
          }
        }
        require("telescope").setup(opts)
        -- To get fzf loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require("telescope").load_extension("file_browser")
    end
}}
