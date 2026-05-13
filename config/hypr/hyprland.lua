-- Autostart
hl.on("hyprland.start", function()
   hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
   hl.dsp.focus({ monitor = "HDMI-A-1" })
   hl.exec_cmd("dunst & waybar")
   hl.exec_cmd("awww-daemon")
end)

-- Configuration Files
require("input")
require("appearance")
