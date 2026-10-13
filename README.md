# MATLAB Labsheet Maker (GNU Octave + LaTeX)

Run .m lab scripts on Fedora Linux, capture console output, and optionally compile a PDF report. GNU Octave is used as the free MATLAB-compatible runtime; this repository does not require a MATLAB license.

## Fedora setup

From the repository directory:

```bash
chmod +x setup_fedora.sh run_all.sh
./setup_fedora.sh
```

The setup script installs GNU Octave and TeX Live through Fedora's dnf package manager. It may ask for your sudo password.

Manual installation:

```bash
sudo dnf install octave texlive-scheme-medium
```

## Run the labs

Put your labsheet .m files in the repository root, then run:

```bash
./run_all.sh
```

The runner discovers all top-level .m files automatically, executes them in sorted order, and saves console logs under output/. If a script fails, the runner reports the error and exits non-zero instead of claiming success. When report.tex and pdflatex are available, it compiles the PDF to output/report.pdf.

Generated output is ignored by Git. Source scripts and the report template are tracked.

## Compatibility note

Octave is highly MATLAB-compatible, but some MATLAB-only toolboxes and functions are unavailable. For MATLAB-specific toolboxes, check whether an Octave equivalent exists or use licensed MATLAB.

## Add your own labsheet

1. Save each task as a separate .m file in this directory.
2. For batch plots, use non-interactive figures when needed. Example:

```matlab
x = 0:0.1:2*pi;
figure('visible', 'off');
plot(x, sin(x));
print('output/sine_plot.png', '-dpng', '-r200');
```

3. Run ./run_all.sh and inspect output/*_output.txt.
4. Edit report.tex to include your tasks, plots, and student details. Do not commit private student details or credentials.

## Project files

- setup_fedora.sh — Fedora dependency installer.
- run_all.sh — batch execution, logging, failure handling, optional PDF compilation.
- report.tex — compact LaTeX report template.
- task1.m and task2.m — example scripts you can replace with your own lab tasks.
