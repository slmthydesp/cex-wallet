#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

modules=(
  db_gateway
  wallet
  signer
  risk_control
  scan/evm_scan
  scan/solana_scan
)

for module in "${modules[@]}"; do
  echo "Installing dependencies for ${module}..."
  (cd "${ROOT}/${module}" && npm install)
done

echo "All dependencies installed."
