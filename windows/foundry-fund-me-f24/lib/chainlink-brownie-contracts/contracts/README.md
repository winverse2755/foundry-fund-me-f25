# Chainlink Smart Contracts

## Installation

```sh
# via pnpm
$ pnpm add @chainlink/contracts
# via npm
$ npm install @chainlink/contracts --save
```

### Directory Structure

```sh
@chainlink/contracts
├── src # Solidity contracts
│   └── v0.8
└── abi # ABI json output
    └── v0.8
```

### Usage

The solidity smart contracts themselves can be imported via the `src` directory of `@chainlink/contracts`:

```solidity
import '@chainlink/contracts/src/v0.8/AutomationCompatibleInterface.sol';
```

## Local Development

Note: Contracts in `dev/` directories are under active development and are likely unaudited. Please refrain from using these in production applications.

```bash
# Clone Chainlink repository
$ git clone https://github.com/smartcontractkit/chainlink.git
# Continuing via pnpm
$ cd contracts/
$ pnpm
$ pnpm test
```

## Contributing

Please try to adhere to [Solidity Style Guide](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/STYLE.md).

Contributions are welcome! Please refer to
[Chainlink's contributing guidelines](https://github.com/smartcontractkit/chainlink/blob/develop/docs/CONTRIBUTING.md) for detailed
contribution information.

Thank you!

### Changesets

We use [changesets](https://github.com/changesets/changesets) to manage versioning the contracts.

Every PR that modifies any configuration or code, should most likely accompanied by a changeset file.

To install `changesets`:
  1. Install `pnpm` if it is not already installed - [docs](https://pnpm.io/installation).
  2. Run `pnpm install`.

Either after or before you create a commit, run the `pnpm changeset` command in the `contracts` directory to create an accompanying changeset entry which will reflect on the CHANGELOG for the next release.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## License

[MIT](https://choosealicense.com/licenses/mit/)
