# flake.nix
# Based on https://devenv.sh/guides/using-with-flake-parts/
{
  description = "bootdev k8s course";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    devenv.url = "github:cachix/devenv";
    nixpkgs.url = "github:cachix/devenv-nixpkgs/rolling";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      imports = [
        inputs.devenv.flakeModule
      ];

      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];

      perSystem =
        {
          config,
          pkgs,
          ...
        }:
        {
          devenv.shells.default = {

            env = {
              KUBECONFIG = "${config.devenv.shells.default.devenv.root}/.kubeconfig";
            };

            # https://devenv.sh/reference/options/
            packages = with pkgs; [
              nixfmt
              nil
              kubectl
              minikube
              devenv
            ];

            # enterShell = ''
            #   echo "HELLO WORLD"
            # '';
          };
        };
    };
}
