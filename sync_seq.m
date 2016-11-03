function [sync_a, sync_b] = sync_seq(fs)

% APT sync
T = 1/4160;

sync_a = ones(1, round(39*T*fs)+1) * (-1);
sync_b = sync_a;
sync_offset = round(4*T*fs) + 1;

% sync A, 7 cycles of 1040 Hz
x_sync_a = 0 : 1/fs : 7/1040;
sync_a(sync_offset : sync_offset+length(x_sync_a)-1) = square(x_sync_a*pi*2*1040);

% sync B, 7 pulses @ 832 pps, duty cycle 60%
x_sync_b = 0 : 1/fs : 7/832;
sync_b(sync_offset : sync_offset+length(x_sync_b)-1) = square(x_sync_b*pi*2*832,60);