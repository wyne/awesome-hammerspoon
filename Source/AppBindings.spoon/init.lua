local obj = {}
obj.__index = obj

-- Metadata
obj.name = "AppBindings"
obj.version = "1.0"
obj.author = "Justin Wyne <justinwyne@gmail.com>"
obj.homepage = "https://github.com/wyne/awesome-hammerspoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

local logger = hs.logger.new("AppBindings", "debug")
obj.logger = logger

function obj:pressFn(mods, key)
  if key == nil then
    key = mods
    mods = {}
  end

  return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

function obj:appRemap(mods, key, remapMods, remapKey)
  fn = self:pressFn(remapMods, remapKey)
  return hs.hotkey.new(mods, key, fn, nil, fn)
end

function obj:init()
  self._init_done = true
  return self
end

-- Translate user input keymap to hs.hotkey functions
function obj:keymapToHotkeys(keymap)
  local hotkeys = {}

  for i, item in pairs(keymap) do
    metaFrom = item[1]
    keyFrom = item[2]
    metaTo = item[3]
    keyTo = item[4]

    table.insert(hotkeys, self:appRemap(metaFrom, keyFrom, metaTo, keyTo))

    self.logger.d("Mapping " ..
      tostring(metaFrom) .. tostring(keyFrom) .. " -> " ..
      tostring(metaTo) .. tostring(keyTo))
  end

  return hotkeys
end

function obj:bind(appTitle, keymap)
  self.logger.d("Found binding for app " .. appTitle)

  local hotkeys = self:keymapToHotkeys(keymap)

  local function enableKeys()
    for i, hotkey in pairs(hotkeys) do
      hotkey:enable()
    end
  end

  local function disableKeys()
    for i, hotkey in pairs(hotkeys) do
      hotkey:disable()
    end
  end

  local appFilter = hs.window.filter

  appFilter.new(appTitle)
  :subscribe(appFilter.windowFocused, enableKeys)
  :subscribe(appFilter.windowUnfocused, disableKeys)
end

return obj
