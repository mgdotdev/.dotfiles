local actions = require("telescope.actions")
local telescope = require('telescope')
telescope.setup {
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
            hidden = true,
            theme = "dropdown",
        },
        live_grep = {
            hidden = true,
            theme = "dropdown",
        },
        grep_string = {
            hidden = true,
            theme = "dropdown",
        },
        buffers = {
            theme = "dropdown",
        }
    },
}
