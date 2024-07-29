FROM rust:alpine AS builder

RUN apk add --no-cache musl-dev curl unzip

WORKDIR /usr/src/ore-cli

ARG BRANCH=master
RUN curl -L https://github.com/regolith-labs/ore-cli/archive/refs/heads/${BRANCH}.zip -o ore-cli.zip && \
    unzip ore-cli.zip && \
    rm ore-cli.zip && \
    mv ore-cli-${BRANCH}/* . && \
    mv ore-cli-${BRANCH}/.* . 2>/dev/null || true && \
    rmdir ore-cli-${BRANCH}

RUN cargo build --release

FROM alpine:latest

RUN addgroup -S ore && adduser -S -G ore -h /ore ore && \
    apk update && apk upgrade libcrypto3 libssl3 && apk add --no-cache libgcc libstdc++ && \
    mkdir -p /ore/.config/solana && chown -R ore:ore /ore/.config

WORKDIR /usr/local/bin

COPY --from=builder --chown=ore:ore --chmod=500 /usr/src/ore-cli/target/release/ore /usr/local/bin/ore
COPY --chown=ore:ore --chmod=500 entrypoint.sh /usr/local/bin/entrypoint.sh

USER ore

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]