#!/bin/sh

MAINNET_URL="https://api.mainnet-beta.solana.com"
DEVNET_URL="https://api.devnet.solana.com"

case "$RPC_URL" in
  mainnet)
    RPC_URL="$MAINNET_URL"
    ;;
  devnet|""|unset)
    RPC_URL="$DEVNET_URL"
    ;;
  *)
    echo "Using custom RPC_URL: $RPC_URL"
    ;;
esac

: "${RPC_URL:=$DEVNET_URL}"

cmd="./ore --rpc \"$RPC_URL\" mine"

if [ -n "$BUFFER_TIME" ]; then
  cmd="$cmd --buffer-time \"$BUFFER_TIME\""
fi

if [ -n "$THREAD_COUNT" ]; then
  cmd="$cmd --threads \"$THREAD_COUNT\""
fi

sh -c "$cmd"