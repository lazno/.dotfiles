local hyper = require("hyper")
local am = require("app-management")

-- enable hyper key (CAPS)
hyper.install("F18")

-- show current time
-- hyper.bindKey("t", function()
-- 	local time = os.date("%A, %d %B %Y, %H:%M")
-- 	hs.alert.show(time)
-- 	hs.pasteboard.setContents(time)
-- end)

-- reload hammerspoon config
hyper.bindKey("r", hs.reload)

hyper.bindKey("0", function()
	am.switchToAndFromApp("com.github.wez.wezterm")
end)

hyper.bindKey("9", function()
	am.switchToAndFromApp("com.microsoft.edgemac")
end)
hyper.bindKey("7", function()
	am.switchToAndFromApp("com.apple.Finder")
end)

hyper.bindKey("8", function()
	am.switchToAndFromApp("com.tinyspeck.slackmacgap")
end)

hyper.bindKey("1", function()
	local myApp = hs.application.applicationsForBundleID("com.github.wez.wezterm")[1]
	hs.eventtap.keyStroke({ "ctrl", "shift" }, "1", 200000, myApp)
end)
hyper.bindKey("2", function()
	local myApp = hs.application.applicationsForBundleID("com.github.wez.wezterm")[1]
	hs.eventtap.keyStroke({ "ctrl", "shift" }, "2", 200000, myApp)
end)

hyper.bindKey("3", function()
	local myApp = hs.application.applicationsForBundleID("com.github.wez.wezterm")[1]
	hs.eventtap.keyStroke({ "ctrl", "shift" }, "3", 200000, myApp)
end)

hyper.bindKey("4", function()
	local myApp = hs.application.applicationsForBundleID("com.github.wez.wezterm")[1]
	hs.eventtap.keyStroke({ "ctrl", "shift" }, "4", 200000, myApp)
end)

hyper.bindKey("e", function()
	am.switchToAndFromApp("inc.tana.desktop")
	local myApp = hs.application.applicationsForBundleID("inc.tana.desktop")[1]
	hs.eventtap.keyStroke({ "cmd" }, "e", 200000, myApp)
end)
