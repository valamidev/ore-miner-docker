FROM rust:alpine

RUN apk add --no-cache musl-dev curl unzip

RUN cargo install ore-cli

# Set the working directory
WORKDIR /app

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Use bash to run the entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]