function ab = split_ab(payload, fs)

line_length = floor(fs/2);
[sync_a, ~] = sync_seq(fs);
lines = vec2mat(payload, line_length);
ab = zeros(size(lines));

[xcorr_a, lag_a] = xcorr_mat(lines, sync_a);
[~, a_split] = max(xcorr_a,[],2);

for N = 1:length(a_split)   
    a_split(N) = (N-1)*line_length+lag_a(N,a_split(N));
    start = round(a_split(N));
    stop = start+line_length-1;

    if(stop > length(payload))
      break
    end
  
    try
        ab(N,:) = payload(start:stop)';
    catch ME
        if (~strcmp(ME.message,'Index exceeds matrix dimensions.'))
            rethrow(ME)
        end
    end
end
