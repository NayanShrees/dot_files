{
  lib,
  ...
}:
let
  lua = lib.generators.mkLuaInline;

  dsp = {
    close = lua "hl.dsp.window.close()";
    exec = cmd: lua ''hl.dsp.exec_cmd("${cmd}")'';
    exit = lua "hl.dsp.exit()";
    float = lua ''hl.dsp.window.float({ action = "toggle" })'';
    focus = dir: lua ''hl.dsp.focus({ direction = "${dir}" })'';
    fullscreen = lua "hl.dsp.window.fullscreen()";
    focusWorkspace = ws: lua ''hl.dsp.focus({ workspace = "${toString ws}" })'';
    moveToWorkspace = ws: lua ''hl.dsp.window.move({ workspace = "${toString ws}" })'';
    layout = msg: lua ''hl.dsp.layout("${msg}")'';
    swap = dir: lua ''hl.dsp.window.swap({ direction = "${dir}" })'';
    pseudo = lua "hl.dsp.window.pseudo()";
  };

  bind = keys: dispatcher: {
    _args = [
      keys
      dispatcher
    ];
  };

  workspaceBinds = lib.concatMap (
    i:
    let
      key = toString (lib.mod i 10);
    in
    [
      (bind "SUPER + ${key}" (dsp.focusWorkspace i))
      (bind "SUPER + SHIFT + ${key}" (dsp.moveToWorkspace i))
    ]
  ) (lib.range 1 10);
in
{

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = false;
    configType = "lua";
    settings = {
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
        };

        decoration = {
          rounding = 5;
          active_opacity = 1.0;
          inactive_opacity = 0.5;
          blur = {
            enabled = true;
            size = 5;
            passes = 3;
          };
        };

        animations.enabled = true;

        input = {
          kb_layout = "gb";
          sensitivity = 0;
          touchpad.natural_scroll = true;
        };
      };

      bind = [
        (bind "CTRL + ALT + T" (dsp.exec "alacritty"))
        (bind "SUPER + SPACE" (dsp.exec "wofi --show drun"))
        (bind "SUPER + Q" dsp.close)
        (bind "SUPER + SHIFT + Q" dsp.exit)
        (bind "SUPER + L" (dsp.exec "hyprlock"))

        (bind "SUPER + SHIFT + F" dsp.float)
        (bind "SUPER + F" dsp.fullscreen)
        (bind "SUPER + P" dsp.pseudo)
        (bind "SUPER + J" (dsp.layout "togglesplit"))

        (bind "SUPER + left" (dsp.focus "left"))
        (bind "SUPER + right" (dsp.focus "right"))
        (bind "SUPER + up" (dsp.focus "up"))
        (bind "SUPER + down" (dsp.focus "down"))

        (bind "SUPER + SHIFT + left" (dsp.swap "left"))
        (bind "SUPER + SHIFT + right" (dsp.swap "right"))
        (bind "SUPER + SHIFT + up" (dsp.swap "up"))
        (bind "SUPER + SHIFT + down" (dsp.swap "down"))

        (bind "XF86AudioMute" (dsp.exec "wpctl set-mute @DEFAULT_SINK@ toggle"))
        (bind "XF86AudioLowerVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
        (bind "XF86AudioRaiseVolume" (dsp.exec "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.0"))
        (bind "XF86MonBrightnessDown" (dsp.exec "brightnessctl s 10%-"))
        (bind "XF86MonBrightnessUp" (dsp.exec "brightnessctl s +10%"))
      ]
      ++ workspaceBinds;

      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.exec_cmd("awww-daemon")
              hl.exec_cmd("awww img ../../wallpapers/1783628494057930.jpg")
            end
          '')
        ];
      };
    };
  };
}
