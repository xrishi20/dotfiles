-- Autostart
hl.on("hyprland.start", function()
   hl.exec_cmd("noctalia")
   hl.exec_cmd("hyprctl dispatch 'hl.dsp.focus({ 'workspace = 1' })'")
end)

-- Configuration Files
require("env")
require("input")
require("appearance")
require("animations")

-- For Noctalia Color templates
require("noctalia").apply_theme()
