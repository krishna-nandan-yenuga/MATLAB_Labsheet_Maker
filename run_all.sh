#!/usr/bin/env bash
set -Eeuo pipefail
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT_DIR"
if ! command -v octave >/dev/null 2>&1; then
  echo "ERROR: GNU Octave is not installed. Run ./setup_fedora.sh first." >&2
  exit 127
fi
mkdir -p output
mapfile -t scripts < <(find . -maxdepth 1 -type f -name '*.m' -printf '%f\n' | sort)
if (("${#scripts[@]}" == 0)); then
  echo "ERROR: No .m scripts found in $ROOT_DIR." >&2
  echo "Add your labsheet scripts to this directory and rerun." >&2
  exit 2
fi
failed=0
for script in "${scripts[@]}"; do
  name="${script%.m}"
  log="output/${name}_output.txt"
  echo "==> Running $script"
  if octave --no-gui --quiet "$script" >"$log" 2>&1; then
    echo "    OK (log: $log)"
  else
    status=$?
    echo "    FAILED with exit code $status (log: $log)" >&2
    cat "$log" >&2
    failed=1
  fi
done
if (( failed )); then
  echo "One or more scripts failed. See output/*_output.txt." >&2
  exit 1
fi
if command -v pdflatex >/dev/null 2>&1 && [[ -f report.tex ]]; then
  echo "==> Compiling report.tex"
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output report.tex
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=output report.tex
  echo "PDF created at output/report.pdf"
else
  echo "Skipping PDF compilation (pdflatex or report.tex is missing)."
fi
echo "All Octave scripts completed successfully."
