% Example task 1: generate and save a sine wave plot.
% Replace this example with one of your own labsheet questions.

if exist('output', 'dir') ~= 7
  mkdir('output');
end

time = 0:0.01:1;
signal = sin(2 * pi * 5 * time);

printf('Task 1: 5 Hz sine wave\n');
printf('Number of samples: %d\n', length(signal));
printf('Maximum sample value: %.4f\n', max(signal));

figure('visible', 'off');
plot(time, signal);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('5 Hz Sine Wave');
print('output/task1_sine.png', '-dpng', '-r200');
close;
