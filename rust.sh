#!/bin/sh

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install additional components
rustup component add llvm-tools

# Add addionnal targets
rustup target add aarch64-linux-android \
     aarch64-unknown-linux-gnu \
     aarch64-apple-darwin \
     aarch64-apple-ios\
     x86_64-unknown-linux-gnu \
     wasm32-wasip1 \
     wasm32-wasip2 
       

# Install nightly toolchain
rustup toolchain install nightly --allow-downgrade --profile minimal --component clippy rust-docs miri

# Install cargo-binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# Install Wasmtime
curl https://wasmtime.dev/install.sh -sSf | bash

# Install addionnal useful binaries.
cargo binstall bacon \
      bat \
      bunyan \
      cargo-audit \
      cargo-audidatble \
      cargo-component \
      cargo-deny \
      cargo-expand \
      cargo-insta \
      maturin \
      cargo-mutants \
      cargo-nextest \
      cargo-semver-checks \
      cargo-udeps \
      cargo-update \
      cargo-tarpaulin \ 
      cbindgen \
      sqlx-cli \
      wasm-tools


