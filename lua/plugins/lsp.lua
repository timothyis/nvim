return {

  -- LSP
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     { "folke/neodev.nvim", opts = {} },
  --     "williamboman/mason.nvim",
  --     "williamboman/mason-lspconfig.nvim",
  --     "WhoIsSethDaniel/mason-tool-installer.nvim",
  --     { "j-hui/fidget.nvim", opts = {} },
  --
  --     -- Autoformatting
  --     "stevearc/conform.nvim",
  --   },
  --
  --   config = function()
  --     local capabilities = nil
  --     if pcall(require, "cmp_nvim_lsp") then
  --       capabilities = require("cmp_nvim_lsp").default_capabilities()
  --     end
  --
  --     local lspconfig = require("lspconfig")
  --
  --     local servers = {
  --       bashls = true,
  --       lua_ls = true,
  --       rust_analyzer = true,
  --       cssls = true,
  --       tsserver = true,
  --     }
  --
  --     local servers_to_install = vim.tbl_filter(function(key)
  --       local t = servers[key]
  --       if type(t) == "table" then
  --         return not t.manual_install
  --       else
  --         return t
  --       end
  --     end, vim.tbl_keys(servers))
  --
  --     require("mason").setup()
  --     local ensure_installed = {
  --       "stylua",
  --       "lua_ls",
  --       "tailwind-language-server",
  --     }
  --
  --     vim.list_extend(ensure_installed, servers_to_install)
  --     require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
  --
  --     for name, config in pairs(servers) do
  --       if config == true then
  --         config = {}
  --       end
  --       config = vim.tbl_deep_extend("force", {}, {
  --         capabilities = capabilities,
  --       }, config)
  --
  --       lspconfig[name].setup(config)
  --     end
  --
  --     local disable_semantic_tokens = {
  --       lua = true,
  --     }
  --
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --       callback = function(args)
  --         local bufnr = args.buf
  --         local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
  --
  --         vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
  --         vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  --         vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
  --         vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
  --         vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
  --         vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  --
  --         vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
  --         vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
  --
  --         local filetype = vim.bo[bufnr].filetype
  --         if disable_semantic_tokens[filetype] then
  --           client.server_capabilities.semanticTokensProvider = nil
  --         end
  --       end,
  --     })
  --
  --     -- Autoformatting Setup
  --     require("conform").setup({
  --       formatters_by_ft = {
  --         lua = { "stylua" },
  --         typescriptreact = { "prettier" },
  --         typescript = { "prettier" },
  --       },
  --     })
  --
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       callback = function(args)
  --         require("conform").format({
  --           bufnr = args.buf,
  --           lsp_fallback = true,
  --           quiet = true,
  --         })
  --       end,
  --     })
  --   end,
  -- },
  --
  -- -- Completion
  -- {
  --   "hrsh7th/nvim-cmp",
  --   lazy = false,
  --   priority = 100,
  --
  --   dependencies = {
  --     "onsails/lspkind.nvim",
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-path",
  --     "hrsh7th/cmp-buffer",
  --     {
  --       "L3MON4D3/LuaSnip",
  --       version = "v2.*",
  --       build = "make install_jsregexp",
  --     },
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --
  --   config = function()
  --     local lspkind = require("lspkind")
  --     lspkind.init({})
  --
  --     local cmp = require("cmp")
  --
  --     cmp.setup({
  --       sources = {
  --         { name = "nvim_lsp" },
  --         { name = "path" },
  --         { name = "buffer" },
  --       },
  --       mapping = {
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-y>"] = cmp.mapping(
  --           cmp.mapping.confirm({
  --             behavior = cmp.ConfirmBehavior.Insert,
  --             select = true,
  --           }),
  --           { "i", "c" }
  --         ),
  --       },
  --
  --       -- Enable luasnip to handle snippet expansion for nvim-cmp
  --       snippet = {
  --         expand = function(args)
  --           require("luasnip").lsp_expand(args.body)
  --         end,
  --       },
  --     })
  --
  --     local ls = require("luasnip")
  --     ls.config.set_config({
  --       history = false,
  --       updateevents = "TextChanged,TextChangedI",
  --     })
  --
  --     vim.keymap.set({ "i", "s" }, "<c-k>", function()
  --       if ls.expand_or_jumpable() then
  --         ls.expand_or_jump()
  --       end
  --     end, { silent = true })
  --
  --     vim.keymap.set({ "i", "s" }, "<c-j>", function()
  --       if ls.jumpable(-1) then
  --         ls.jump(-1)
  --       end
  --     end, { silent = true })
  --   end,
  -- },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- Mason
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- LSP Config
      "neovim/nvim-lspconfig",
    },
    config = function ()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require("mason").setup()
      require('mason-lspconfig').setup({
        -- Replace the language servers listed here 
        -- with the ones you want to install
        ensure_installed = {'tsserver', 'rust_analyzer'},
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  },

  { "folke/neodev.nvim", opts = {} },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      { "rafamadriz/friendly-snippets" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      local cmp = require('cmp')

      local cmp_action = lsp_zero.cmp_action()

      -- this is the function that loads the extra snippets
      -- from rafamadriz/friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'luasnip', keyword_length = 2},
          {name = 'buffer', keyword_length = 3},
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- confirm completion item
          ['<Enter>'] = cmp.mapping.confirm({ select = true }),

          -- trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- scroll up and down the documentation window
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          -- navigate between snippet placeholders
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        -- note: if you are going to use lsp-kind (another plugin)
        -- replace the line below with the function from lsp-kind
        formatting = lsp_zero.cmp_format({details = true}),
      })
    end,


  },
}
