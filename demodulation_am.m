function payload = demodulation_am(signal, fs, fc)

envelope = abs(signal);
[B,A] = butter(10, fc*2/fs);
payload = filter(B, A, envelope);