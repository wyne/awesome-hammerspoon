-- Grid
hs.window.animationDuration=0.0
local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

grid.MARGINX = 20
grid.MARGINY = 20
grid.GRIDHEIGHT = 4
grid.GRIDWIDTH = 6

local mod_resize = { "ctrl", "cmd" }
local mod_move = { "ctrl", "alt" }

-- Move Window
hotkey.bind(mod_move, 'j', grid.pushWindowDown)
hotkey.bind(mod_move, 'k', grid.pushWindowUp)
hotkey.bind(mod_move, 'h', grid.pushWindowLeft)
hotkey.bind(mod_move, 'l', grid.pushWindowRight)

-- Resize Window
hotkey.bind(mod_resize, 'k', grid.resizeWindowShorter)
hotkey.bind(mod_resize, 'j', grid.resizeWindowTaller)
hotkey.bind(mod_resize, 'l', grid.resizeWindowWider)
hotkey.bind(mod_resize, 'h', grid.resizeWindowThinner)

-- SPOONS

-- Vim Bindings

hs.loadSpoon("VimBindings")

-- OSX Notification Clicker

hs.loadSpoon("NotiClicker")

spoon.NotiClicker:bindHotkeys({
  top    = { "ctrl", ";" },
  bottom = { "ctrl", "'" },
})

-- App Specific Bindings

hs.loadSpoon("AppBindings")

spoon.AppBindings:bind('Telegram', {
  { { 'cmd', 'shift' }, ']', { 'alt' }, 'down' }, -- Next chat window
  { { 'cmd', 'shift' }, '[', { 'alt' }, 'up' },   -- Prev chat window
  { 'ctrl', 'n', {}, 'pagedown' },  -- Scroll message window
  { 'ctrl', 'p', {}, 'pageup' },    -- Scroll message window
})

spoon.AppBindings:bind('Notion', {
  { { 'cmd', 'shift' }, ']', { 'cmd' }, ']' },
  { { 'cmd', 'shift' }, '[', { 'cmd' }, '[' },
  { 'cmd', 'o', 'cmd', 'k' },  -- Open search
})

spoon.AppBindings:bind('Slack', {
  { 'ctrl', 'n', {}, 'pagedown' },  -- Scroll message window
  { 'ctrl', 'p', {}, 'pageup' },    -- Scroll message window
})
