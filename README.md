# Ore CLI in Docker

## Description

`ore-miner-docker` is a Dockerized version of the [Ore CLI](https://github.com/regolith-labs/ore-cli) application. It is a Solana-based application that allows you to mine ORE tokens.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/valamidev/ore-miner-docker.git
   cd ore-miner-docker
   docker-compose build --no-cache
   ```

2. **Run Solana Cli to generate Keypair**:

   ```sh
   docker-compose up solana-cli
   ```

3. **Get Solana Devnet Faucet**:

   - [Solana Faucet](https://faucet.solana.com/)

   - Your wallet address in `./config/publicKey` file

   - Verify that your account has been funded:

   - [Solana Devnet Explorer](https://explorer.solana.com/?cluster=devnet)

4. **Build and start the Docker containers**:

   ```sh
   docker-compose up ore-cli
   ```

5. **Enjoy**

```sh
ore-cli-1  | Using custom RPC_URL: "https://api.devnet.solana.com"
ore-cli-1  | A command line interface for the ORE cryptocurrency mining.
ore-cli-1  |
ore-cli-1  | Usage: ore [OPTIONS] <COMMAND>
ore-cli-1  |
ore-cli-1  | Commands:
ore-cli-1  |   balance    Fetch an account balance
ore-cli-1  |   benchmark  Benchmark your hashpower
ore-cli-1  |   busses     Fetch the bus account balances
ore-cli-1  |   claim      Claim your mining rewards
ore-cli-1  |   close      Close your account to recover rent
ore-cli-1  |   config     Fetch the program config
ore-cli-1  |   mine       Start mining
ore-cli-1  |   rewards    Fetch the current reward rate for each difficulty level
ore-cli-1  |   stake      Stake to earn a rewards multiplier
ore-cli-1  |   upgrade    Upgrade your ORE tokens from v1 to v2
ore-cli-1  |   help       Print this message or the help of the given subcommand(s)
ore-cli-1  |
ore-cli-1  |   -h, --help                          Print help
ore-cli-1  |   -V, --version                       Print version
ore-cli-1  |
ore-cli-1  | Stake balance: 0.00604324633 ORE

```

## Config

Open `docker-compose.yml` and change the following environment variables as needed:

```
    command:
      [
        "ore",
        "--rpc",
        "https://api.devnet.solana.com",
        "mine",
        "--buffer-time",
        "5",  # Buffer time in seconds
        "--threads",
        "6", # Number of threads to use
      ]
```
