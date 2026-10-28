{
  description = "Stanley's Neovim configuration built with nvf";

  inputs = {
    nvf.url = "github:notashelf/nvf";
    # Follow nvf's nixpkgs so builds hit the nvf binary cache.
    nixpkgs.follows = "nvf/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (pkgs: {
      default =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [./config];
        }).neovim;
    });

    apps = forAllSystems (pkgs: {
      default = {
        type = "app";
        program = "${self.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nvim";
      };
    });

    formatter = forAllSystems (pkgs: pkgs.alejandra);
  };
}
