# Ore CLI in Docker

## Description

`ore-miner-docker` is a Dockerized version of the [Ore CLI](https://github.com/regolith-labs/ore-cli) application. It is a Solana-based application that allows you to mine ORE tokens.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Solana-cli for generate keypair:

- [Solana CLI](https://docs.solanalabs.com/cli/install)

```sh
solana-keygen new --outfile ./id.json
```

## Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/valamidev/ore-miner-docker.git
   cd ore-miner-docker
   ```

2. **Create a Solana Wallet file and copy into the ./config/id folder**:

   ```sh
   solana-keygen new --outfile ./id.json
   sudo mv id.json ./config/id.json
   ```

3. **Get Solana Devnet Faucet**:

   - [Solana Faucet](https://faucet.solana.com/)

   - Use your wallet's PublicKey to receive faucet tokens

   - Verify that your account has been funded:

   - [Solana Devnet Explorer](https://explorer.solana.com/?cluster=devnet)

4. **Build and start the Docker containers**:
   ```sh
   docker-compose up --build
   ```

## Usage

To launch the ore mining application, simply run:

```sh
docker-compose up
```

## Config

Open `docker-compose.yml` and change the following environment variables as needed:

```
    environment:
      - RUST_LOG=info
      - RPC_URL="https://api.devnet.solana.com"
      - BUFFER_TIME=5
      - NETWORK=devnet
      - THREAD_COUNT=12
```
