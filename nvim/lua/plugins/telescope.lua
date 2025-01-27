return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- stylua: ignore
    {
      "<space>",
      function() require("telescope.builtin").git_files() end,
      desc = "Find Git file",
    },
  },
}
