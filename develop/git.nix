{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Simone Ragusa";
    userEmail = "simone99.as@gmail.com";
    aliases = {
      co = "commit";
      ch = "checkout";
      fa = "fetch --all";
      lg = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      st = "status -s";
      tree = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit";
    };
    extraConfig = {
      http.cookiefile = "~/.gitcookies";
      credential.helper = "cache --timeout=1200";  # timeout after 20 minutes
    };
  };

  home.packages = [
    pkgs.git-revise
  ];
}
