{
  inputs = {
    utils.url = "github:numtide/flake-utils";
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    inotify-info.url = "github:mikesart/inotify-info";
  };

  outputs = { self, nixpkgs, utils, nix-vscode-extensions, inotify-info }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        inherit (pkgs) vscode-with-extensions vscodium;
        vscodeExtensions = nix-vscode-extensions.outputs.extensions.${system};

        vscode = vscode-with-extensions.override {
          vscode = vscodium;
          vscodeExtensions = [
            vscodeExtensions.vscode-marketplace.arcanis.vscode-zipfs
          ];
        };
      in {
        packages.default = inotify-info.packages."${system}".default;
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            yarn
            nodejs
            vscode
          ];
        };
      });
}
