return {
    -- enable mini.starter
    {
        "echasnovski/mini.starter",
        version = false,
        event = "VimEnter",
        opts = function()
            local logo = [[
___    ______                 ___________          
__ |  / /__(_)______ ___________  /___  /______  __
__ | / /__  /__  __ `__ \  __ \  __/_  __ \_  / / /
__ |/ / _  / _  / / / / / /_/ / /_ _  / / /  /_/ / 
_____/  /_/  /_/ /_/ /_/\____/\__/ /_/ /_/_\__, /  
                                          /____/   
            ]]
            local pad = string.rep(" ", 2)
            local new_section = function(name, action, section)
                return { name = name, action = action, section = section }
            end

            local starter = require("mini.starter")
            --stylua: ignore
            local config = {
                evaluate_single = true,
                header = logo,
                items = {
                    starter.sections.recent_files(10, true),
                    new_section("New file",     "ene | startinsert",                               "Files"),
                    new_section("Find file",    "Telescope find_files",                            "Files"),
                    new_section("Browse Files", "Neotree filesystem reveal float toggle",          "Files"),
                    new_section("Grep text",    "Telescope live_grep",                             "Files"),
                    new_section("init.lua",     "e $MYVIMRC",                                      "Vimothy"),
                    new_section("Lazy",         "Lazy",                                            "Vimothy"),
                    new_section("Quit",         "qa",                                              "Vimothy"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(pad .. "░ ", false),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
            return config
        end,
        config = function(_, config)
            -- close Lazy and re-open when starter is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "MiniStarterOpened",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            local starter = require("mini.starter")
            starter.setup(config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 1)
                    starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(starter.refresh)
                end,
            })
        end,
    },
}
