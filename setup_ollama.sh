#!/usr/bin/env bash
set -euo pipefail

VERSION="v0.18.2"


INSTALL_DIR="${HOME}/.local"
mkdir -p "${INSTALL_DIR}"

ARCHIVE="ollama-linux-amd64.tar.zst"

wget "https://github.com/ollama/ollama/releases/download/${VERSION}/${ARCHIVE}"

unzstd -f "${ARCHIVE}"
tar -xf "ollama-linux-amd64.tar" -C "${INSTALL_DIR}"

# Clean up
rm -f "${ARCHIVE}" "ollama-linux-amd64.tar"

export PATH="${INSTALL_DIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${INSTALL_DIR}/lib/ollama:${LD_LIBRARY_PATH:-}"

# ollama serve &
# sleep 3
# ollama -v