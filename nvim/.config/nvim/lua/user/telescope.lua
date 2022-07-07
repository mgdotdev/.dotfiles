local actions = require("telescope.actions")
local telescope = require('telescope')

local function merge(tables)
    local result = {}
    for _, items in pairs(tables) do
        for _, item in pairs(items) do
            table.insert(result, item)
        end
    end
    return result
end

local function globber(glob_table)
    local result = {}
    for _, item in pairs(glob_table) do
        table.insert(result, "--glob")
        table.insert(result, item)
    end
    return result
end

local glob_table = {
    "!**/.git/**",
    "!**/venv/**",
    "!**/__pycache__/**",
    "!**/node_modules/**",
    "!**/.pytest_cache/**",
}

local globs = globber(glob_table)

local hiddens = {
    "--hidden",
    "--no-ignore",
}

telescope.setup{
    defaults = {
        layout_strategy = "vertical",
        shorten_path = false,
        mappings = {
            i = {
                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
            }
        }
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            find_command = merge{
                {"rg"},
                hiddens,
                globs,
                {"--files"},
            }
        },
        live_grep = {
            theme = "dropdown",
            additional_args = function()
                return merge{
                    hiddens,
                    globs,
                }
            end,
        },
        grep_string = {
            theme = "dropdown",
            additional_args = function()
                return merge{
                    hiddens,
                    globs,
                }
            end,
        },
        current_buffer_fuzzy_find = {
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        }
    },
}
