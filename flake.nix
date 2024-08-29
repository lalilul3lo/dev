
{
  outputs = {nixpkgs, ...}: let

    forAllSystems = function:
      nixpkgs.lib.genAttrs [
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: function nixpkgs.legacyPackages.${system});

  in {
    packages = forAllSystems (pkgs: {
      default = pkgs.hello;
    });

    templates = {
      rust = {
        path = ./rust;
        description = "Rust development environment";
      };
      rust_bin = {
        path = ./rust_bin;
        description = "Rust development environment for a binary";
      };
    };
  };
}
