local home = os.getenv("HOME")
local vimrc_path = home.."/.config/nvim/.vimrc"
local vimfile = io.open(vimrc_path, "rb")
local vimsettings = vimfile:read "*a"
vimfile:close()
vim.cmd(vimsettings)

