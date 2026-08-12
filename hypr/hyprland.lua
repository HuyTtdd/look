local var_mainMod = "SUPER"

-- See https://wiki.hyprland.org/Configuring/Monitors/
hl.monitor({
    output = "",
    disabled = false,
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-- Some default env vars.
hl.env("XCURSOR_SIZE", "12")

-- env = GTK_IM_MODULE,fcitx
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("INPUT_METHOD", "fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

-- Execute your favorite apps at launch

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user import-environment QT_QPA_PLATFORMTHEME")
    hl.exec_cmd("fcitx5-remote -r")
end)

hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"")
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")

-- Source a file (multi-file configs)
require("mocha")

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
    general = {
        border_size = 2,
        gaps_in = 3,
        gaps_out = 5,
        gaps_workspaces = 0,
        col = {
            inactive_border = "rgba(595959aa)",
            active_border = {
                colors = {"0xff" .. var_mauveAlpha, "0xff" .. var_lavenderAlpha},
                angle = 45,
            },
            nogroup_border = "0xffffaaff",
            nogroup_border_active = "0xffff00ff",
        },
        layout = "dwindle",
        no_focus_fallback = false,
        resize_on_border = true,
        extend_border_grab_area = 5,
        hover_icon_on_border = true,
        allow_tearing = false,
        resize_corner = 0,
    },
})

-- # https://wiki.hyprland.org/Configuring/Variables/#decoration
hl.config({
    decoration = {
        rounding = 5,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        fullscreen_opacity = 1.0,
        dim_inactive = false,
        dim_strength = 0.5,
        dim_special = 0.2,
        dim_around = 0.4,
        -- screen_shader =
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            ignore_opacity = false,
            new_optimizations = true,
            xray = false,
            noise = 0.0117,
            contrast = 0.8916,
            brightness = 0.8172,
            vibrancy = 0.1696,
            vibrancy_darkness = 0.0,
            special = false,
            popups = false,
            popups_ignorealpha = 0.2,
        },
    },
})

hl.config({
    animations = {
        enabled = true,
    },
})

-- Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 4,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 4,
    bezier = "default",
})

-- For all categories, see https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({
    input = {
        kb_model = "",
        kb_layout = "us",
        kb_variant = "",
        kb_options = "caps:escape",
        kb_rules = "",
        kb_file = "",
        numlock_by_default = false,
        resolve_binds_by_sym = false,
        repeat_rate = 40,
        repeat_delay = 400,
        sensitivity = 0,
        accel_profile = "",
        force_no_accel = false,
        left_handed = false,
        scroll_points = "",
        scroll_method = "",
        scroll_button = 0,
        scroll_button_lock = 0,
        scroll_factor = 1.0,
        natural_scroll = false,
        follow_mouse = 1,
        mouse_refocus = true,
        float_switch_override_focus = 1,
        special_fallthrough = false,
        off_window_axis_events = 1,
        touchpad = {
            disable_while_typing = true,
            natural_scroll = false,
            scroll_factor = 1.0,
            middle_button_emulation = false,
            tap_button_map = "",
            clickfinger_behavior = false,
            -- ["tap-to-click"] = true,
            drag_lock = false,
            -- ["tap-and-drag"] = false,
        },
        touchdevice = {
            transform = 0,
            output = "",
            enabled = false,
        },
        tablet = {
            transform = 0,
            output = "DP-3",
            region_position = "0 0",
            region_size = "0 0",
            relative_input = false,
            left_handed = false,
            active_area_size = "0 0",
            active_area_position = "0 0",
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures
hl.config({
    gestures = {
        workspace_swipe_distance = 300,
        workspace_swipe_touch = false,
        workspace_swipe_invert = true,
        workspace_swipe_min_speed_to_force = 30,
        workspace_swipe_cancel_ratio = 0.5,
        workspace_swipe_create_new = true,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_forever = false,
        workspace_swipe_use_r = false,
    },
    group = {
        insert_after_current = true,
        focus_removed_window = true,
        col = {
            border_active = "0x66ffff00",
            border_inactive = "0x66777700",
            border_locked_active = "0x66ff5500",
            border_locked_inactive = "0x66775500",
        },
        groupbar = {
            enabled = true,
            font_family = "",
            font_size = 8,
            gradients = true,
            height = 14,
            stacked = false,
            priority = 3,
            render_titles = true,
            scrolling = true,
            text_color = "0xffffffff",
            col = {
                active = "0x66ffff00",
                inactive = "0x66777700",
                locked_active = "0x66ff5500",
                locked_inactive = "0x66775500",
            },
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        col = {
            splash = "0xffffffff",
        },
        font_family = "\"Sans\"",
        splash_font_family = "",
        force_default_wallpaper = 0,
        vrr = 0,
        mouse_move_enables_dpms = false,
        key_press_enables_dpms = false,
        always_follow_on_dnd = true,
        layers_hog_keyboard_focus = true,
        animate_manual_resizes = false,
        animate_mouse_windowdragging = false,
        disable_autoreload = false,
        enable_swallow = false,
        swallow_regex = "",
        swallow_exception_regex = "",
        focus_on_activate = false,
        mouse_move_focuses_monitor = true,
        allow_session_lock_restore = false,
        background_color = "0x111111",
        close_special_on_empty = false,
    },
})

-- new_window_takes_over_fullscreen = 0
hl.config({
    misc = {
        initial_workspace_tracking = 1,
        middle_click_paste = true,
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#binds
hl.config({
    binds = {
        pass_mouse_when_bound = false,
        scroll_event_delay = 300,
        workspace_back_and_forth = false,
        allow_workspace_cycles = false,
        workspace_center_on = 0,
        focus_preferred_method = 0,
        ignore_group_lock = false,
        movefocus_cycles_fullscreen = true,
        disable_keybind_grabbing = false,
        window_direction_monitor_fallback = true,
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#xwayland
hl.config({
    xwayland = {
        enabled = true,
    },
    cursor = {
        no_hardware_cursors = false,
        hotspot_padding = 1,
        default_monitor = "",
        zoom_factor = 1.0,
        zoom_rigid = false,
        enable_hyprcursor = true,
        hide_on_key_press = false,
        hide_on_touch = false,
    },
})

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        force_split = 2,
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor = 1,
        split_width_multiplier = 1.0,
        use_active_for_splits = true,
        default_split_ratio = 1.0,
    },
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
hl.config({
    master = {
        allow_small_split = false,
        special_scale_factor = 1,
        mfact = 0.55,
        new_on_top = false,
        orientation = "left",
        smart_resizing = true,
        drop_at_cursor = true,
    },
})

-- Start app
-- bind = $mainMod, Return, exec, wezterm
hl.bind(var_mainMod .. " + Return", hl.dsp.exec_cmd("[float;tile] wezterm start --always-new-process"))
hl.bind(var_mainMod .. " + F", hl.dsp.exec_cmd("nautilus"))
hl.bind(var_mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(var_mainMod .. " + R", hl.dsp.exec_cmd(".config/rofi/launchers/type-7/launcher.sh -show drun"))

-- Lock screen
hl.bind(var_mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Close active window
hl.bind(var_mainMod .. " + CTRL + SHIFT + Q", hl.dsp.window.close())

-- Toggle thingy
hl.bind(var_mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(var_mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind(var_mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(var_mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(var_mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(var_mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(var_mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Cycle through windows on a workspace
hl.bind(var_mainMod .. " + Tab", hl.dsp.window.cycle_next())
hl.bind(var_mainMod .. " + SHIFT + Tab", hl.dsp.window.cycle_next())

-- Switch workspaces with mainMod + [0-9]
hl.bind(var_mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(var_mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(var_mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(var_mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("CTRL + ALT + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("CTRL + ALT + h", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("CTRL + ALT + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("CTRL + ALT + left", hl.dsp.focus({ workspace = "e-1" }))

-- Move active window to workspace and switch workspace
hl.bind("CTRL + SHIFT + ALT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("CTRL + SHIFT + ALT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("CTRL + SHIFT + ALT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("CTRL + SHIFT + ALT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("CTRL + SHIFT + ALT + l", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("CTRL + SHIFT + ALT + h", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("CTRL + SHIFT + ALT + right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("CTRL + SHIFT + ALT + left", hl.dsp.window.move({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(var_mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})
hl.bind(var_mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})

-- Screenshot a window
hl.bind(var_mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))

-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Screenshot a region
hl.bind(var_mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Window rules
hl.window_rule({
    match = {
        class = "org.kde.polkit-gnome-authentication-agent-1",
    },
    float = true,
})
hl.window_rule({
    match = {
        title = "Picture-in-Picture",
    },
    float = true,
})
hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },
    float = true,
})

-- Layer rules
hl.layer_rule({
    match = {
        class = "waybar",
    },
    blur = true,
})

-- Workspace rules
hl.workspace_rule({workspace = 1, monitor = "DP-3", persistent = true})
hl.workspace_rule({workspace = 2, monitor = "DP-3", persistent = true})
hl.workspace_rule({workspace = 3, monitor = "DP-3", persistent = true})
hl.workspace_rule({workspace = 4, monitor = "DP-3", persistent = true})

hl.workspace_rule({
    workspace = "w[t1]",
    gaps_out = 0,
    gaps_in = 0,
    no_border = true,
    no_rounding = true,
})
hl.workspace_rule({
    workspace = "w[tg1]",
    gaps_out = 0,
    gaps_in = 0,
    no_border = true,
    no_rounding = true,
})

-- HyprMod managed settings
require("hyprland-gui")
