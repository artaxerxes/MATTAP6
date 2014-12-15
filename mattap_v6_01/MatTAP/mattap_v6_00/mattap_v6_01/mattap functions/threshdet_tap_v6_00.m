%extracts onsets from tap and sync pulse data.

function [onsets, clean_data,offs ] = threshdet_tap_v6_00(rdata, mn_isi, Fs, ons_thresh_const)
%
% ------------ MatTAP Toolbox Function ---------------
% Copyright 2007, 2008, University of Birmingham, UK
% 
% Movement & metronome onset extraction function. 
%
% Inputs:
% RDATA   raw_data matrix (col 1: metronome 1, col2: responses)
% MN_ISI  mean ISI setting of metronome
% FS      Sampling frequency (samples/second)
% ONS_THRESH_CONST  onset threshold
%
% Outputs:
% ONSETS     Extracted onset times
% CLEAN_DATA Raw data after filtering etc. 
% OFFS Baseline offset amount added to threshhold const
%


% ons_thresh_const = 0.2; %onset threshold
hyst = 0.1; %diff between up and down thresholds. 
clean_data = zeros(size(rdata));
onsets = []; %stores onset points
hld_cnt = ceil(Fs/1000); %1ms hold to stop glitches
new_cnt = 0;

%% clean up the tap pulse
for k = 1:size(rdata, 2) %for each column    
    ons = [];
    offs = median(rdata(:,k));
    ons_thresh = ons_thresh_const + offs;
    for i=2:length(rdata(:,k))
        switch clean_data(i-1,k) %create a clean data pulse (use hysteresis)
            case 0
                if rdata(i,k)>ons_thresh && new_cnt == 0
                   new_cnt =  1; %start hold counter 
                   clean_data(i, k) = 1;
                   %check for a valid onset...
                   if isempty(ons) || (i-1 - ons(end) > (mn_isi*1e-3*(Fs/2))); %> 1/2 the ISI to be valid. 
                        ons = [ons; i-1]; %start of sync pulse.
                   end
                else
                   clean_data(i, k) = 0;
                   if new_cnt < hld_cnt && new_cnt > 0 %if we're counting
                       new_cnt = new_cnt + 1; %increment hold counter
                   else
                       new_cnt = 0; %else reset to zero. 
                   end
                end
            case 1
                if rdata(i,k)< (ons_thresh-hyst) && new_cnt == 0
                    new_cnt = 1; %start hold counter
                    clean_data(i, k) = 0;
                else
                    clean_data(i, k) = 1;
                    if new_cnt < hld_cnt && new_cnt > 0 %if we're counting
                        new_cnt = new_cnt + 1; %increment hold counter
                    else
                        new_cnt = 0; %else reset to zero. 
                    end
                end
        end
    end
    onsets{k} = ons;
end
        
        
        
        
%          && (clean_data(i-1, k) == 0)
%              %reconstruct clean pulse data
%             if clean_data(i-1, k) == 0
%                 if isempty(ons) || (i-1 - ons(end) > (mn_isi*1e-3*(Fs/2))); %> 1/2 the ISI to be valid. 
%                     ons = [ons; i-1]; %start of sync pulse.
%                 end
%             end
%         elseif (rdata(i,k) > (ons_thresh - 0.05)) && (clean_data(i-1, k) == 1)
%             clean_data(i, k) = 1; %keep high until past the noise thresh (hysteresis)
%         end
%     end
%     onsets{k} = ons; 
%end
    
