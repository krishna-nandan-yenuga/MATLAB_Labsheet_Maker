# Labsheet Processing Workflow (Fedora)

## 1. Install dependencies

On Fedora, run:

```bash
chmod +x setup_fedora.sh run_all.sh
./setup_fedora.sh
```

The setup script installs GNU Octave and TeX Live using dnf. The first installation requires an internet connection and sudo access.

## 2. Add the lab tasks

Save each independent task as a top-level .m file in this repository. Use GNU Octave-compatible functions where possible. Some MATLAB toolboxes are not available in Octave.

## 3. Run and verify

```bash
./run_all.sh
```

The runner executes all top-level .m files in sorted order and writes logs to output/<script>_output.txt. It stops with a non-zero exit status if any task fails. Plots should be saved to the output directory for batch execution, for example:

```matlab
if exist('output', 'dir') ~= 7
  mkdir('output');
end
x = 0:0.1:2*pi;
figure('visible', 'off');
plot(x, sin(x));
print('output/sine_plot.png', '-dpng', '-r200');
close;
```

## 4. Generate the report

When report.tex and pdflatex are available, run_all.sh compiles the report twice and places the result at output/report.pdf. Update report.tex to include the actual tasks, plots, and outputs for your labsheet.

## 5. Keep credentials private

Do not commit .env files, roll numbers, or other private details. Keep student information in your local report copy and review the PDF before submission.
