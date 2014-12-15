function aligned_onsets = warp_align_sheff(m, t)
% --------- MatTAP Toolbox Function -----------
% Copyright 2007, 2008 University of Birmingham, UK
%
% Onset alignment algorithm - Aligns each tap onset to the most appropriate
% metronome onset. Can cope with missed taps (inserts NaN) and multi-taps (chooses closest to metronome) 
%
% Mark Elliott December 2007 - Thanks for to Leif Johanssen for suggesting 
% this algorithm
%
% Inputs: m = metronome onsets, t = tap onsets

M=length(m); %Length of metronome vector
T=length(t); %Length of tap vector
aligned_taps = zeros(M, 1); %places aligned taps in here
d=(repmat(t(:),1,M)-repmat(m(:)',T,1)).^2; %find sq distance between each element

[min_t, i] = min(d, [], 1); %find the min of each column (returns a tap index)
[min_m, j] = min(d, [], 2); %find the min of row (returns a metronome index)

for n = 1:M
    m_match = find(j == n); %find the taps aligned to each metronome pulse
    switch length(m_match)
        case 0 %No taps for this metronome onset
            aligned_taps(n) = NaN;
        case 1 % One tap found corresponding to metronome onset
            aligned_taps(n) = t(m_match); 
        otherwise %Multiple taps found corresponding to metronome onset - choose closest. 
            if n>1 && isempty(find(j==n-1,1))
                j(m_match(1)) = n-1; %readjust index list
                aligned_taps(n-1) = t(m_match(1)); %add to aligned taps
                m_match = m_match(2:end); %drop the reassigned index
            elseif isempty(find(j==n+1,1))
                j(m_match(end)) = n+1;
                m_match = m_match(1:end-1);
            end
              
            [val, ind] = min(min_m(m_match)); %find the minimum of remainding matches
            aligned_taps(n) = t(m_match(ind)); %multiple taps align to one metronome - find closest
            
            %find the minimum distance of those chosen to metronome n, use
            %that index to pick out the onset from t.
    end
end
 
aligned_onsets = [m, aligned_taps]; %Return final matrix: Col1 = metronome, Col2 = corresponding taps

