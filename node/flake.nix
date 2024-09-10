{
  description = "Nix flake for node development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        inherit (pkgs) lib;
      in
      {
        overlays.default = final: prev: rec {
          nodejs_22 = prev.nodejs_22;
          yarn = (prev.yarn.override { inherit nodejs_22; });
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nodejs_22
            nodePackages.typescript
            nodePackages.typescript-language-server
            oxlint
            yarn
          ];
        };
      }
    );
}
