require('nvim-tree').setup{
    disable_netrw = true,
    open_on_tab = false,
    git = {
        ignore = false,
    },
    view = {
        side = "right",
        width = 65,
    },
    filters = {
        custom = {
            "__pycache__"
        }
    }
}
