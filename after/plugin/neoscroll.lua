neoscroll = require('neoscroll')
neoscroll.setup({
	easing = "linear"
})

local keymap = {
	["K"] = function() neoscroll.ctrl_u({ duration = 100 }) end,
	["J"] = function() neoscroll.ctrl_d({ duration = 100 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end
