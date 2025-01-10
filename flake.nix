{
  description = "Docker Environment flake";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-darwin";
      };

    in {
      devShell.x86_64-darwin = pkgs.mkShell {
        buildInputs = [
          pkgs.colima
          pkgs.docker
          pkgs.lazydocker
        ];

        shellHook = ''
          WORKSPACE_PATH="$PWD"
          echo "Setting up docker environment in $WORKSPACE_PATH"
          colima start --mount "$WORKSPACE_PATH"
          docker --version
          # lazydocker

          # Function to stop Colima
          stop_colima() {
            echo "Stopping Colima..."
            colima delete
          }

          # Set up to stop Colima on shell exit
          trap stop_colima EXIT
          '';
        };
      };
  }
