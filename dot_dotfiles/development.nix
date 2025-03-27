{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    go
    nodejs-slim
    nodePackages.pnpm
    nodePackages.wrangler
    deno
    bun
    python312
    zig
  ];
}
