# Rusty-ML

Pytorch based ML dev with Rust.

## Setup

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
