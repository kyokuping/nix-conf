hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

hl.env("GTK_IM_MODULE", "kime")
hl.env("QT_IM_MODULE", "kime")
hl.env("XMODIFIERS", "@im=kime")
hl.env("XCURSOR_SIZE", "24")

hl.config({
    general = { gaps_in = 5, gaps_out = 10, border_size = 2, layout = "dwindle" },
    decoration = { rounding = 8 },
    input = {
        kb_layout = "kr",
        kb_options = "korean:ralt_hangul",
        follow_mouse = 1,
        touchpad = { natural_scroll = true },
    },
    dwindle = { preserve_split = true },
    misc = { disable_hyprland_logo = true },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm finalize")
    hl.exec_cmd("waybar -c \"${XDG_CONFIG_HOME:-$HOME/.config}/hypr/waybar.json\"")
    hl.exec_cmd("mako")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprlauncher --toggle"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("uwsm stop"))

for _, direction in ipairs({ "left", "right", "up", "down" }) do
    hl.bind("SUPER + " .. direction, hl.dsp.focus({ direction = direction }))
end
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })
