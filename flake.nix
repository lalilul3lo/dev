{
  outputs =
    { nixpkgs, ... }:
    let

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-darwin"
          "aarch64-darwin"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: {
        default = pkgs.hello;
      });

      templates = {
        node = {
          path = ./node;
          description = "NodeJS development environment";
        };
        rust_bin = {
          path = ./rust_bin;
          description = "Rust development environment for a binary";
        };
        rust_lib = {
          path = ./rust_lib;
          description = "Rust development environment for a library";
        };
      };
    };
}
