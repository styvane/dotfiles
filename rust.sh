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

# Install Webassembly tools
cargo install cargo-component \
      wit-bindgen \
      wasm-tools
# Wasmtime
curl https://wasmtime.dev/install.sh -sSf | bash

# Install addionnal useful binaries.
cargo install --force cbindgen \
      bunyan \
      cargo-nextest \
      cargo-udeps \
      cargo-watch \
      cargo-audit \
      cargo-expand \
      cargo-update \
      cargo-tarpaulin \ 
      cargo-insta \
      cargo-sqlx \
      bat


