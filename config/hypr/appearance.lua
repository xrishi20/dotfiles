-- Monitors
hl.monitor({ output = "DP-3", mode = "2560x1440@180", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1200@60", position = "2560x0", scale = 1 })

-- Assign Workspaces to Monitors
for i = 1, 2 do
   hl.workspace_rule({ workspace = i, monitor = "DP-3", persistent = true })
end

for i = 3, 9 do
   hl.workspace_rule({ workspace = i, monitor = "eDP-1" })
end

-- Theming
hl.on("hyprland.start", function()
   hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing rgba")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting slight")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Papirus'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Inter'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono NF'")
   hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Vision'")
   hl.exec_cmd("hyprctl setcursor Vision 24")
end)

-- Decoration
hl.config({
   general = {
      gaps_in          = 2,
      gaps_out         = 8,

      border_size      = 2,

      col              = {
         active_border   = "rgb(33ccff)",
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
         noise    = 0.05
      },
   },

   animations = {
      enabled = true,
   },
})

-- Misc
hl.config({
   misc = {
      force_default_wallpaper = -1,
      disable_hyprland_logo   = true,
   },
})

-- GTK Portal
hl.window_rule({
   name = "fileManager",
   match = {
      class = "(xdg-desktop-portal-gtk)",
   },
   move = { "window_w * 0.5", "monitor_h * 0.25" },
   size = { "monitor_w * 0.5", "monitor_h * 0.5" },
   float = true,
   stay_focused = true
})

-- Noctalia Settings
hl.window_rule({
   match = { class = "dev.noctalia.Noctalia" },
   float = true,
   size = { "monitor_w * 0.6", "monitor_h * 0.7" },
})

-- Noctalia Blur
hl.layer_rule({
   name = "noctalia",
   match = {
      namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
   },
   no_anim = true,
   ignore_alpha = 0.5,
   blur = true,
   blur_popups = true,
})
