{
  description = "Helix with built-in config + LSP";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    systems.url = "github:nix-systems/default";
    wrappers.url = "github:birdeehub/nix-wrapper-modules";
    wrappers.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      forAllSystems =
        f: nixpkgs.lib.genAttrs (import inputs.systems) (system: f (import nixpkgs { inherit system; }));
    in
    {
      packages = forAllSystems (
        pkgs:
        let
          pkgList = with pkgs; [
            nixd
            nixfmt
            fish-lsp
            bash-language-server
            vscode-langservers-extracted
            csharp-ls
            ruff
            rust-analyzer
            tombi
            yaml-language-server
            lua-language-server
            marksman
            markdown-oxide
            harper
            mpls
            prettier
            git
            lazygit
          ];
        in
        {
          default = inputs.wrappers.wrappers.helix.wrap {
            inherit pkgs;
            runtimePkgs = pkgList;
            settings = import ./config.nix;
            languages = import ./languages.nix;
          };
        }
      );
    };
}
