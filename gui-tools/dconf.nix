{ config, pkgs, ... }:

{
  dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-show-date = true;
      clock-show-seconds = false;
      clock-show-weekday = false;
      cursor-theme = "Paper";
      enable-hot-corners = true;
      gtk-theme = "Arc-Dark";
      icon-theme = "Papirus-Dark";
      locate-pointer = true;
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "fingers";
      disable-while-typing = true;
      natural-scroll = false;
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-camera = true;
      disable-microphone = true;
      old-files-age = 7;
      remember-recent-files = false;
      remove-old-temp-files = true;
      remove-old-trash-files = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      panel-main-menu = [ "Super_L" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      mouse-button-modifier = "<Super>";
      num-workspaces = 1;
    };

    "org/gnome/mutter" = {
      dynamic-workspace = true;
      edge-tiling = true;
      overlay-key = "";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "nothing";
    };

    "org/gnome/shell" = {
      app-picker-view = 1;
      enabled-extensions = ["dash-to-panel@jderose9.github.com" "arc-menu@linxgem33.com" "drive-menu@gnome-shell-extensions.gcampax.github.com"];
      favorite-apps=["org.gnome.Nautilus.desktop" "firefox.desktop" "spotify.desktop" "Alacritty.desktop" "code.desktop"];
    };

    "org/gnome/shell/extensions/arc-menu" = {
      avatar-style = "Circular";
      custom-menu-button-icon-size = 32.0;
      disable-activities-hotcorner = false;
      disable-hotkey-onkeyrelease = false;
      enable-custom-arc-menu = false;
      enable-pinned-apps = true;
      menu-button-appearance = "Icon";
      menu-button-icon = "System_Icon";
      menu-hotkey = "Super_L";
      menu-keybinding = [];
      menu-keybinding-text = "<Super>";
      menu-layout = "Default";
      multi-monitor = true;
      pinned-app-list = ["Alacritty" "Alacritty" "Alacritty.desktop" "Firefox" "firefox" "firefox.desktop" "Visual Studio Code" "code" "code.desktop"];
      position-in-panel = "Left";
      show-software-shortcut = false;
      show-terminal-shortcut = true;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      dot-position = "BOTTOM";
      hotkeys-overlay-combo = "TEMPORARILY";
      intellihide = false;
      location-clock = "STATUSRIGHT";
      panel-position = "BOTTOM";
      show-activities-button = false;
      show-appmenu = false;
      show-show-apps-button = false;
      taskbar-position = "LEFTPANEL";
      trans-use-custom-opacity = false;
    };

    "org/gnome/system/location" = {
      enabled = false;
    };
  };
}
