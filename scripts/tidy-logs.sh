#!/usr/bin/env bash
# tidy-logs.sh - very simple log rotation (rename + gzip)
# Usage: tidy-logs.sh [LOG_DIR]
# Default LOG_DIR: ~/logs

set -euo pipefail

LOG_DIR="${1:-$HOME/logs}"

if [ ! -d "$LOG_DIR" ]; then
  echo "Log directory not found: $LOG_DIR"
  exit 1
fi

for f in "$LOG_DIR"/*.log; do
  [ -e "$f" ] || continue
  ts=$(date +%Y%m%d_%H%M%S)
  mv -- "$f" "$f.$ts"
  gzip -9 -- "$f.$ts"
  : > "$f"   # recreate empty log file so writers won't fail
  echo "Rotated: $(basename "$f").$ts.gz"
done
