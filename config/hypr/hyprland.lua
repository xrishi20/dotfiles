-- Autostart
hl.on("hyprland.start", function()
   hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
   hl.exec_cmd("dunst & waybar")
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd("hyprctl dispatch 'hl.dsp.focus({ 'workspace = 1' })'")
end)

-- Configuration Files
require("input")
require("appearance")
