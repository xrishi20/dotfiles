-- Basic Keyboard Setup
hl.config({
   input = {
      kb_layout     = "us",

      follow_mouse  = 1,
      accel_profile = "flat",
      sensitivity   = 0,

      touchpad      = {
         natural_scroll = true,
      },
   },
})

-- Touchpad Gestures
hl.gesture({
   fingers = 3,
   direction = "horizontal",
   action = "workspace"
})

-- Dwindle Split
hl.config({
   dwindle = {
      preserve_split = true,
   },
})

-- Programs
local browser     = "librewolf"
local editor      = "zeditor"
local terminal    = "kitty"
local fileManager = "nautilus"

-- Application Shortcuts
hl.bind("SUPER + return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + T", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + C", hl.dsp.exec_cmd(editor))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + W", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind("SUPER + space", hl.dsp.exec_cmd("tofi-drun --drun-launch=true"))
hl.bind("SUPER + escape", hl.dsp.window.close(window))
hl.bind("SUPER + SHIFT + escape", hl.dsp.window.kill(window))
hl.bind("SUPER + SHIFT + delete", hl.dsp.exec_cmd("uwsm stop"))
hl.bind("SUPER + K",
   hl.dsp.exec_cmd(
      "hyprpicker --format hex| head -c -1 | wl-copy && notify-send \"$(wl-paste)\" 'Copied to your clipboard!'"))

-- Screenshot
hl.bind("Print",
   hl.dsp.exec_cmd(
      "grim -g \"$(slurp)\" ~/Pictures/screenshot.png && wl-copy < ~/Pictures/$(ls -Art ~/Pictures | tail -n 1)"))

-- Volume Control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })

-- Brightness Control - Monitor
hl.bind("SUPER + SHIFT + page_up", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"), { locked = true })
hl.bind("SUPER + SHIFT + page_down", hl.dsp.exec_cmd("ddcutil setvcp 10 - 10"), { locked = true })

-- Brightness Control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { locked = true })

-- Media Control
hl.bind("XF86AudioMedia", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

-- Switch Workspaces
hl.bind("SUPER + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + right", hl.dsp.focus({ workspace = "+1" }))

-- Shift Window to Workspace
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))

-- Move focus
hl.bind("SUPER + CTRL + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + CTRL + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + CTRL + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ direction = "right" }))

-- Shift Windows
hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Window Sizing
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + comma", hl.dsp.layout("splitratio -0.1"))
hl.bind("SUPER + period", hl.dsp.layout("splitratio +0.1"))

-- Window Actions
hl.bind("SUPER + G", hl.dsp.window.float())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + H", hl.dsp.window.center())

-- Switch workspaces
-- Move active window to a workspaces
for i = 1, 10 do
   local key = i % 10 -- 10 maps to key 0
   hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
   hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces using mouse
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "-1" }))

-- Move/resize windows using mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Fix Issues
hl.window_rule({
   -- Fix some dragging issues with XWayland
   name     = "fix-xwayland-drags",
   match    = {
      class      = "^$",
      title      = "^$",
      xwayland   = true,
      float      = true,
      fullscreen = false,
      pin        = false,
   },

   no_focus = true,
})
