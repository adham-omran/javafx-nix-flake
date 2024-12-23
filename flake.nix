{
  description = "A flake for JavaFX development.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }:

    let
      javaVersion = 23;
      overlays = [
        (final: prev: rec {
          jdk = prev."jdk${toString javaVersion}";
        })
      ];
      supportedSystems = [ "x86_64-linux"
                           "aarch64-linux"
                           "x86_64-darwin"
                           "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit overlays system; };
      });
    in
      {
        devShells = forEachSupportedSystem ({ pkgs }: {
          default = pkgs.mkShell {
            packages = with pkgs; [
              # Java
              jdk
              maven
              # JavaFX
              javaPackages.openjfx23
              glib
              gtk3
              gtk4
              xorg.libXxf86vm
            ];
            LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
            LD_LIBRARY_PATH = "${pkgs.libGL}/lib:${pkgs.gtk3}/lib:${pkgs.glib.out}/lib:${pkgs.xorg.libXtst}/lib";
          };
        });
      };
  nixConfig.bash-prompt = "(nix) \\$ ";
}
