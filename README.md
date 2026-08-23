# bootdev-k8s

## Environment Setup

This repo uses [`devenv`](https://devenv.sh/) for tooling. After setup, all the required CLI tools like `nixfmt`, etc. are available automatically when you `cd` in.

1. Install a `nix` distribution if you don't have one already. The snippet below will install [Determinate Nix](https://docs.determinate.systems/).

    ```bash
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install
    ```

2. Install `devenv` and `direnv`. If you manage packages
   declaratively (home-manager, nix-darwin, NixOS), add them there instead.

    ```bash
    nix profile add nixpkgs#devenv nixpkgs#direnv
    ```

3. [Hook `direnv` into your shell](https://direnv.net/docs/hook.html), if you haven't. Restart your shell afterward.

4. Allow `direnv` activation at the repo root.

    ```bash
    direnv allow
    ```

## Notes on tunneling

```bash
minikube tunnel -c
```

Then you check the gateway IP at

```bash
kubectl describe gateway app-gateway
```

If it changes, also change the `/etc/hosts`.
