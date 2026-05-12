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
         active_border   = "rgb(fca062)",
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
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fade", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2, bezier = "quick" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 2, bezier = "quick" })

-- Misc
hl.config({
   misc = {
      force_default_wallpaper = -1,
      disable_hyprland_logo   = true,
   },
})
