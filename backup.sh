#!/usr/bin/env bash
# Simple local backup: copy repo to backups/ with timestamp
set -e
OUTDIR="backups/$(date +%F_%H-%M-%S)"
mkdir -p "$OUTDIR"
cp -r . "$OUTDIR"
echo "Backed up to $OUTDIR"
