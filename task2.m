% Example task 2: create and save a discrete-time impulse sequence.
% Replace this example with one of your own labsheet questions.

if exist('output', 'dir') ~= 7
  mkdir('output');
end

num = -10:10;
signal = zeros(size(num));
signal(num == 0) = 1;

printf('Task 2: unit impulse sequence\n');
printf('Sequence length: %d\n', length(signal));
printf('Impulse value at n=0: %.0f\n', signal(num == 0));

figure('visible', 'off');
stem(num, signal, 'filled');
grid on;
xlabel('n');
ylabel('Amplitude');
title('Unit Impulse Sequence');
print('output/task2_impulse.png', '-dpng', '-r200');
close;
