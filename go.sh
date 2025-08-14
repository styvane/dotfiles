#!/usr/bin/env bash
VERSION="1.25.0"
DIR="${HOME}/Downloads"
wget "https://go.dev/dl/go${VERSION}.darwin-arm64.tar.gz" -P "${DIR}"
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf "${DIR}/go${VERSION}.darwin-arm64.tar.gz"
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
