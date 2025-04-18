return {
  {
    "tpope/vim-fugitive",
    event = "User FilePost",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "configs.gitsigns"
    end,
  },
}
