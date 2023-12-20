# Rusty-ML

Pytorch based ML dev with Rust.

## Setup

### NixOS/Nix

For NixOS, use `nix-shell` to enter the environment.

```bash
nix-shell
```

Create a virtual environment and install the dependencies.

```bash
make venv_create
source .venv/bin/activate
make requirements_install
```

Run the code:

```bash
make run
```

### Docker

Use `docker-compose` to build and run the container.

```bash
make up
```

Use the container

```bash
make connect
```

## Resources

- [Pytorch in Docker](https://perception-ml.com/setting-up-libtorch-in-a-simple-docker-environment/)
