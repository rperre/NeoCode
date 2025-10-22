require("which-key").add({
  {
    "<leader>b",
    desc = "Buffer",
    mode = "n",
    noremap = true
  },
  {
    "<leader>bw",
    "<cmd>w<CR>",
    desc = "Save buffer",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>bb",
    "<cmd>Telescope buffers<CR>",
    desc = "Buffer list",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>bd",
    "<cmd>bd<CR>",
    desc = "Delete buffer",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>bn",
    "<cmd>bn<CR>",
    desc = "Next buffer",
    mode = "n",
    noremap = true,
  },
  {
    "<leader>bp",
    "<cmd>bp<CR>",
    desc = "Previous buffer",
    mode = "n",
    noremap = true,
  },
})
