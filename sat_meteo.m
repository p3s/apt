close all;
clear all;

[signal, fs] = audioread('N18_4827.wav');
fc = 2400;

payload = demodulation_am(signal, fs, fc);
[ab] = split_ab(payload, fs);

figure(1);
colormap(gray);
imagesc(ab)