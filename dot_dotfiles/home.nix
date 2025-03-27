{pkgs, ...}: {
  imports = [
    ./neovim.nix
    ./development.nix
  ];
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";

  home.packages = with pkgs; [
    nnn 
    lazygit
    eza
    ranger
    bat
    bottom
    httpie
    ripgrep
    fzf
    zoxide #cd
  ];
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
