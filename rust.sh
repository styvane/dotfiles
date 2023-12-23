#!/bin/sh

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install additional components
rustup component add llvm-tools

# Add addionnal targets
rustup target add x86_64-unknown-linux-gnu \
       wasm32-unknown-unknown \
       wasm32-wasi \
       x86_64-unknown-linux-musl \
       x86_64-unknown-linux-gnu \
       aarch64-linux-android aarch64-unknown-linux-gnu \
       aarch64-unknown-linux-musl \
       aarch64-apple-darwin \
       aarch64-apple-ios
       

# Install nightly toolchain
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rust-docs miri

# Install addionnal useful binaries.
cargo install --force cbindgen \
      cargo-bunyan \
      cargo-nextest \
      cargo-udeps \
      cargo-watch \
      cargo-audit \
      cargo-expand \
      cargo--update \
      cargo-tarpaulin \ 
      cargo-insta \
      cargo-sqlx \
      bunyan


# Install wasmtime
curl https://wasmtime.dev/install.sh -sSf | bash

# Install wasm-tools
cargo install --force wasm-tools

# Install wasm cargo-component
cargo install --git https://github.com/bytecodealliance/cargo-component --locked cargo-component
