# Bug repro: yarn 4 + pnp + typescript 5.x + workspace dep

## Setup

### Install node, yarn and vscodium (or vscode)

Following versions have been used to when creating this report:

```sh
node --version
# v18.18.2
yarn --version
# 4.0.2
codium --version
# 1.84.2
```

The easiest way to install everything is:

1. Install nix:

```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```

2. Run the following from the root of the repo

```sh
nix develop
```

This will drop you in a shell with all binary deps available on `PATH`.

### Install node deps

```sh
yarn
```

## Reproduce the bug

1. Open project in vscod(e|ium)

    ```sh
    codium .
    ```

    or if you have `vscode` installed


    ```sh
    code .
    ```

2. navigate to [packages/one/index.ts](packages/one/index.ts) and follow instruction in the comments.

    :warning: you might need to accept a prompt in the bottom right corner of your editor to accept
    the use of project local TypeScript version.
