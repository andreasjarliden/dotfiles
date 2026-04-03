return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function() 
      require("neo-tree").setup({
        filesystem = {
          bind_to_cwd = false,
          filtered_items = {
            hide_gitignored = true,
          },
        },
      })
      vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>', {})
      vim.keymap.set('n', '<leader>d', ':Neotree filesystem left dir=~/.config/nvim <CR>', {})
    end
  }
