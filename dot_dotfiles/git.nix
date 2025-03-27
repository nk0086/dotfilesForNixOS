{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "nk0086";
    userEmail = "n172586k@gmail.com";
  };

  # GitHub CLI
  programs.gh = {
    enable = true;
    extensions = with pkgs; [gh-markdown-preview]; 
    settings = {
      editor = "nvim";
    };
  };
}
