{ config, pkgs, ... }:

{
  home.file.".xinitrc".text = ''
    eval $(/run/wrappers/bin/gnome-keyring-daemon --start --deamonize --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
  '';
}
