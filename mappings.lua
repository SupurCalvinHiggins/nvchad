local M = {}

-- Disable arrow keys.
M.hardmode = {
  n = {
    ["<Up>"] = { "<nop>", "disabled arrows" },
    ["<Down>"] = { "<nop>", "disabled arrows" },
    ["<Left>"] = { "<nop>", "disabled arrows" },
    ["<Right>"] = { "<nop>", "disabled arrows" },
  },
  i = {
    ["<Up>"] = { "<nop>", "disabled arrows" },
    ["<Down>"] = { "<nop>", "disabled arrows" },
    ["<Left>"] = { "<nop>", "disabled arrows" },
    ["<Right>"] = { "<nop>", "disabled arrows" },
  },
  v = {
    ["<Up>"] = { "<nop>", "disabled arrows" },
    ["<Down>"] = { "<nop>", "disabled arrows" },
    ["<Left>"] = { "<nop>", "disabled arrows" },
    ["<Right>"] = { "<nop>", "disabled arrows" },
  },
}

-- Enable custom escape.
M.custom = {
  i = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
  v = {
    ["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

-- Enable debugging keymaps.
M.dap = {
  n = {
    ["<Up>"] = {
      function()
        require("dap").step_out()
      end
    },
    ["<Down>"] = {
      function()
        require("dap").step_into()
      end
    },
    ["<Right>"] = {
      function()
        require("dap").step_over()
      end
    },
    ["<leader>bb"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle breakpoint",
    },
    ["<leader>du"] = {
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

return M
