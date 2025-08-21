return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
      require("flash").setup({})

      vim.keymap.set({ "n", "x", "o" }, "s", function()
          require("flash").jump()
      end, { desc = "flash jump" })

      vim.keymap.set({ "n", "x", "o" }, "S", function()
          require("flash").treesitter()
      end, { desc = "flash treesitter" })

      vim.keymap.set("o", "r", function()
          require("flash").remote()
      end, { desc = "remote flash" })

      vim.keymap.set({ "o", "x" }, "R", function()
          require("flash").treesitter_search()
      end, { desc = "treesitter search" })

      vim.keymap.set("c", "<c-s>", function()
          require("flash").toggle()
      end, { desc = "toggle flash search" })
  end
}
