local telescope = require('telescope')
telescope.setup {
    defaults = {
        layout_strategy = "vertical",
        shorten_path = false,
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}
