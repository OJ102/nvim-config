return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },

  -- git: gitsigns already ships in NvChad core, this adds diff/history view
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
  },

  -- bridges mason-installed LSP servers to lspconfig automatically
  -- same trigger as core nvim-lspconfig so it's ready before a real file opens
  {
    "mason-org/mason-lspconfig.nvim",
    event = "User FilePost",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = { "html", "cssls" },
      automatic_installation = true,
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP toggle breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "DAP continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "DAP step into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "DAP step over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "DAP step out" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "DAP toggle repl" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "DAP toggle UI" },
    },
    config = function()
      require "configs.dap"
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  },
}
