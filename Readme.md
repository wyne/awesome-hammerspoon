## Spoons

### AppBindings.spoon

This spoon allows you to easily set custom app-specific key bindings.

Just provide the app name as seen in the menubar and a mapping from and to new keyboard shortcut.

#### Installation

**Download:** AppBindings.zip

**Open:** `AppBindings.spoon`

**Configure:** Add to your `init.lua`

Usage: Replace `App Name` and variables below.

```lua
hs.loadSpoon("AppBindings")

spoon.AppBindings:bind('App Name', {
--  |----FROM----| |------TO------|
--  |meta  ,  key| |meta   ,  key |
  { {'meta'}, 'a', {'meta'}, 'down' }, -- Description
})
```

Example:

```lua
-- App Specific Bindings

hs.loadSpoon("AppBindings")

spoon.AppBindings:bind('Telegram', {
  { {'cmd', 'shift'}, ']', {'alt'}, 'down' }, -- Next chat window
  { {'cmd', 'shift'}, '[', {'alt'}, 'up' },   -- Prev chat window
  { {'ctrl'}, 'n', {}, 'pagedown' },          -- Scroll message window
  { {'ctrl'}, 'p', {}, 'pageup' },            -- Scroll message window
})

spoon.AppBindings:bind('Notion', {
  { {'cmd', 'shift'}, ']', {'cmd'}, ']' },
  { {'cmd', 'shift'}, '[', {'cmd'}, '[' },
  { {'cmd'}, 'o', {'cmd'}, 'k' },  -- Open search
})

spoon.AppBindings:bind('Slack', {
  { {'ctrl'}, 'n', {}, 'pagedown' },  -- Scroll message window
  { {'ctrl'}, 'p', {}, 'pageup' },    -- Scroll message window
})
```

Reload configuration
