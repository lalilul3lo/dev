#flake.nix
{
  description = "A nix flake based Rust development environment.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, self }:
    {
      packages.aarch64-darwin =
        let
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        in
        {
          default = pkgs.callPackage ./package.nix { };
        };
      devShells.aarch64-darwin =
        let
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        in
        {
          default = pkgs.mkShell {
              inputsFrom = [ self.packages.${pkgs.stdenv.system}.default ];
              packages = [ pkgs.rust-analyzer pkgs.clippy pkgs.rustfmt ];
            };
        };
    };
}
