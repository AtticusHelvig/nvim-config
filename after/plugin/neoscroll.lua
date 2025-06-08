neoscroll = require('neoscroll')
neoscroll.setup({
	easing = "linear"
})

local keymap = {
	["K"] = function() neoscroll.ctrl_u({ duration = 75 }) end,
	["J"] = function() neoscroll.ctrl_d({ duration = 75 }) end,
	["<C-u>"] = function() neoscroll.ctrl_u({ duration = 75 }) end,
	["<C-d>"] = function() neoscroll.ctrl_d({ duration = 75 }) end,
	["<C-b>"] = function() neoscroll.ctrl_b({ duration = 125 }) end,
	["<C-f>"] = function() neoscroll.ctrl_f({ duration = 125 }) end,
	["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 25 }) end,
	["zt"] = function() neoscroll.zt({ half_win_duration = 75 }) end,
	["zz"] = function() neoscroll.zz({ half_win_duration = 75 }) end,
	["zb"] = function() neoscroll.zb({ half_win_duration = 75 }) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
	vim.keymap.set(modes, key, func)
end
