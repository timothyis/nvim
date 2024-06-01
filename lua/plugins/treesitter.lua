return {
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { "RRethy/nvim-treesitter-endwise" },
      {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
      },
      { "nvim-treesitter/nvim-treesitter-context", opts = true },
    },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "gitignore",
        "help",
        "html",
        "htmldjango",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true,
        language_tree = true,
        additional_vim_regex_highlighting = false,
        is_supported = function()
          if vim.fn.strwidth(vim.fn.getline(".")) > 300 or vim.fn.getfsize(vim.fn.expand("%")) > 1024 * 1024 then
            return false
          else
            return true
          end
        end,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["a/"] = "@comment.outer",
          },
        },
      },

      indent = {
        enable = true,
      },

      endwise = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Autotag closing
  {
    "windwp/nvim-ts-autotag",
    opts = {
      -- Defaults
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = true, -- Auto close on trailing </
    },
  },
}
