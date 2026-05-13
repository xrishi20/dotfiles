-- Monitors
hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@144", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "2560x0", scale = 1 })

-- Assign Workspaces to Monitors
for i = 1, 2 do
   local key = i % 10
   hl.workspace_rule({ workspace = key, monitor = "HDMI-A-1" })
end

for i = 3, 10 do
   local key = i % 10
   hl.workspace_rule({ workspace = key, monitor = "eDP-1" })
end

-- Theming
hl.on("hyprland.start", function()
   hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing rgba")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting slight")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Colloid-Green'")
   hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences theme 'Colloid-Green'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Inter'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono NF'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-white-cursors'")
   hl.exec_cmd("setcursor Qogir-white-cursors 24")
end)

-- Decoration
hl.config({
   general = {
      gaps_in          = 2,
      gaps_out         = 8,

      border_size      = 2,

      col              = {
         active_border   = "rgb(bfe87d)",
         inactive_border = "rgba(ffffff40)",
      },

      resize_on_border = false,
      allow_tearing    = false,

      layout           = "dwindle",
   },

   decoration = {
      rounding         = 10,
      rounding_power   = 2,

      active_opacity   = 1.0,
      inactive_opacity = 1.0,

      shadow           = {
         enabled = false,
      },

      blur             = {
         enabled  = true,
         size     = 3,
         passes   = 3,
         vibrancy = 0.125,
      },
   },

   animations = {
      enabled = true,
   },
})

-- Animations
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })

-- Misc
hl.config({
   misc = {
      force_default_wallpaper = -1,
      disable_hyprland_logo   = true,
   },
})
