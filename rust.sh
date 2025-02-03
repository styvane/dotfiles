#!/usr/bin/env bash

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s --  -y --no-modify-path

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

# Bash completion for rust toolchains
rustup completions bash > $(brew --prefix)/etc/bash_completion.d/rustup.bash-completion

# Install cargo-binstall
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# Install Wasmtime
curl https://wasmtime.dev/install.sh -sSf | bash

# Install additional useful binaries.
cargo binstall --locked --no-confirm \
      bacon \
      bat \
      bunyan \
      cargo-audit \
      cargo-auditable \
      cargo-component \
      cargo-deny \
      cargo-expand \
      cargo-insta \
      cargo-make \
      cargo-mutants \
      cargo-nextest \
      cargo-semver-checks \
      cargo-udeps \
      cargo-update \
      cargo-tarpaulin \
      cbindgen \
      eza \
      maturin \
      sqlx-cli \
      starship \
      tokio-console \
      wash-cli \
      wasm-tools \
      wkg

# Install additional useful binaries with features
cargo install --locked taplo-cli --features lsp
