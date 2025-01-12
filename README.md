# Docker Flake

> [!NOTE]  
> The project is a work in progress and is currently only usable on macOS.

- docker
- colima
- lazydocker

## Getting started

With flakes enabled
```console
WORKSPACE_PATH=<workspace-path> nix develop github:ajahl/docker-flake
```

With cloned repo in a local setup
```console
WORKSPACE_PATH=<workspace-path> nix develop
```

Update the flake
```console
nix flake update
```
