{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    # <nixos-wsl/modules>
  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs;[
    wget
    nix-ld-rs
    zsh
    neovim
    git 
    gh
    chezmoi
    qdrant
    python312Packages.qdrant-client
    docker
    docker-compose
  ];

  
  wsl = {
    enable = true;
    defaultUser = "nixos";
  };
  system.stateVersion = "24.11";
  users.users.nixos.shell = pkgs.zsh;
  home-manager.backupFileExtension = "backup";
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = {
      enable = true;
      #autocd = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        cat = "bat";
        grep = "rg";
        ls = "eza --icons always --classify always";
        la = "eza --icons always --classify always --all ";
        ll = "eza --icons always --long --all --git ";
        tree = "eza --icons always --classify always --tree";
	      update = "cd ~/.dotfiles && sudo nixos-rebuild switch --flake .";
	      ch = "chezmoi";
	      r = "ranger";
      };
    };
    starship.enable = true;
  };
}
