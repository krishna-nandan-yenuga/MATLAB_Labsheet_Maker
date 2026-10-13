#!/usr/bin/env bash
set -Eeuo pipefail

if ! command -v dnf >/dev/null 2>&1; then
  echo "This installer is for Fedora and other dnf-based distributions." >&2
  exit 1
fi

sudo dnf install -y octave texlive-scheme-medium
chmod +x "$(dirname -- "$0")/run_all.sh"
echo "Dependencies installed. Run ./run_all.sh to execute the lab scripts."
