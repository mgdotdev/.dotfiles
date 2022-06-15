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

local globs = {
    "--glob",
    "!**/.git/**",
    "--glob",
    "!**/venv/**",
    "--glob",
    "!**/__pycache__/**",
    "--glob",
    "!**/node_modules/**",
}

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
        buffers = {
            theme = "dropdown",
        }
    },
}
