return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")
        },
      })

      -- Optional keymaps
      vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end)
      vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end)
      vim.keymap.set("n", "<leader>ts", function() require("neotest").run.run({ suite = true }) end)
      vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end)
      vim.keymap.set("n", "<leader>to", function() require("neotest").output.open() end)
    end,
  },
}
