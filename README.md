# Infra EVM parachain

The **Infra EVM parachain** is a ready-to-use EVM-based parachain (based on the [Frontier project](https://github.com/InfraBlockchain/infra-frontier)), pre-configured with the [Assets](https://github.com/InfraBlockchain/infrablockchain-sdk/tree/master/substrate/frame/assets) pallet, a simple Governance system ([Collective](https://github.com/InfraBlockchain/infrablockchain-sdk/tree/master/substrate/frame/collective) & Motion pallets), and EVM precompiles.

This is an ideal starting point for any Parachain project that needs to support legacy Solidity smart contracts, but that wants at the same time to benefit from the flexibility provided by Substrate, and the shared security of the Infra relay chain.

## 🚀 Getting Started

### 🦀 Rust Setup

Make sure you have Rust installed along with everything that's needed to compile a substrate node. More details [here](./docs/rust-setup.md).

### 🔧 Build

1. Clone the Infra EVM parachain repository:

```sh
git clone https://github.com/InfraBlockchain/infra-evm-parachain
```

2. Use `cargo` to build the parachain node without launching it:

```sh
cargo build --release
```

### 🕸️ Run a local network
 You will need a compatible release of [infrablockchain-sdk](https://github.com/InfraBlockchain/infrablockchain-sdk) to run a local network. You may also want to use [Zombienet](https://github.com/paritytech/zombienet/releases) (available for Linux and MacOS),  for spinning up a full fledged relay chain - parachain environment. You can find more information about running a local test network [HERE](./docs/zombienet.md)