require("which-key").add({
  {
    "<c-w><space>",
    function()
      require("which-key").show({ keys = "<c-w>", loop = true })
    end,
    mode = "n",
    desc = "LOCK THIS MENU UNTIL ESCAPE",
  },
  {
    "<space>w",
    function()
      require("which-key").show({ keys = "<c-w>" })
    end,
    mode = "n",
    desc = "Window"
  },
})
