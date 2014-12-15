function [t_mins, t_maxs] = pk_det_20120206(t, mdata, type, fc, pk_sens, t_allow_min, t_allow_max, delay_neg)

t_maxs = []; %empty we don;t want peaks
% t = time vector
% mdata - the original movement data
% type - type of analysis
% fc - filter cut off frequency (0-1)
% pk_sens - sensitivity of peak detection.
% t_allow_min, max - proportion of ISI which gap between peaks must be greater
% delay_neg - delay the peak detection so it drops the first n peaks.

[b,a] = butter(8, fc, 'low');
fdata = filtfilt(b,a,mdata); %filter data

fdata = mdata; %no filtering
d_data = diff(fdata);   %diffe for velocity
dd_data = diff(d_data);  % diff twice for accel

%figure % only for loop function
%plot(d_data)
%title(['Filtered Velocity, Cut-off: ' num2str(fc)]);

% Type (choose velocity or acceleration measure)

if strcmp(type, 'p')
    data = fdata; %find peaks
    reduce = 0;
elseif strcmp(type, 'v')
    data = d_data; %find peak velocities
    reduce = 1;
elseif strcmp(type, 'a')
    data = dd_data; %find peak accelerations
    reduce = 2;
else
    disp('invalid type - using acceleration')
    data = dd_data;
    reduce = 2;
end

% mainly for accel; mean square of data as threshold -only values above
% that mean are choosen

data_c = data;




%data_down
bline = sqrt(mean(data.^2))./2; %take mean to get a baseline threshold.
data_pbl=data_c;


[maxp, minp_tmp] = peakdet(data_pbl, pk_sens); %find peaks above baseline (returns pos&neg peaks;uses peak detect. mat)
% minp = minp_tmp(minp_tmp(:,2) < mean(data_pbl), :);
minp = minp_tmp;
%manuals overide of peaks

%figure
%hold on;
%plot (mdata);
%plot (pk,mdata(pk),'sg');

%plot velocity or accelerations
% figure
% title(['Trial data is -> ', type])
% hold on;
% plot(t(1:end-reduce), data, '-b');
% hold on


%plot(t(b_inds(minp(:,1))), data(b_inds(minp(:,1))), 'or')
%plot(t(b_inds(maxp(:,1))), data(b_inds(maxp(:,1))), 'ob')

% NEGATIVE PEAKS

% Taking the distance between each peak
% minp = minp(delay_neg+1:end, :); %drop the first n peaks.
% minp_a = t(minp(2:end,1));  % 1st peak
% minp_b = t(minp(1:end-1,1)); % 2nd peak
% mn_time_allow = mean(minp_a - minp_b)*t_allow_min; %how much time must be between peaks. look at mean gap between the peaks & apply scalar window factor
% max_time_allow = mean(minp_a - minp_b) * 1.5;
% val = find((minp_a - minp_b) > mn_time_allow & (minp_a - minp_b) < max_time_allow); % make sure to choose peaks within window range & get rid of others
% val = val + 1; %offset indices by one to align properly
% minp_valid = minp(val, :);
% minp_valid = [minp(1,:); minp_valid]; %assume first is always valid - CHECK!
minp_valid = minp;

% 
% %is plot rubbish?
% rubbish_str = input('IS THIS PLOT BUNKUM y/n?  If so we must fiddle!', 's');
% channel = 1;
% if rubbish_str == 'y'
%     %call the resuce program!
%     old_annotations(:,1) = (t(minp_valid(:,1)));
%     old_annotations(:,2) = data(minp_valid(:,1))';
%     raw_data = data;
%     t_data = t(1:end-reduce);
%     [new_annotations] = annotate_data_300112(raw_data,t_data , old_annotations,  channel);
% 
%     final_annotations = [old_annotations ; new_annotations];
%     final_annotations = sortrows(final_annotations, 1);
%  
%     
%     %%%%%% new cut off at beginning
%     cutoff_beg = str2num(input('START OF CUT? ','s'));
%     final_annotations = final_annotations(final_annotations(:,1)> cutoff_beg, :);
%     final_annotations = final_annotations(1:end, :);
%     
%        
%     cutoff_end = str2num(input('END VALUE OF CUT? ','s'));
%     final_annotations = final_annotations(final_annotations(:,1)< cutoff_end, :);
%     final_annotations = final_annotations(1:end, :);
%     
%     plot(t(1:end-reduce), data, '-g');
%     hold on
%     plot(final_annotations(:,1),final_annotations(:,2) , 'sr') % plot peaks onto data
%     hold off
%     disp('REVISED DATA SHOWN')
%     pause
%     beep
%     
% else
%     %yay
% end

% rubbish_str = input('IS THIS PLOT STILL BUNKUM - too many? y/n?', 's');
% channel = 1;
% if rubbish_str == 'y'
%     %call the resuce program!
% cutoff = str2num(input('AFTER WHAT VALUE DO WE CUT','s'));
%     final_annotations = final_annotations(find(final_annotations(:,1)< cutoff), :)
% else
%     %yay
% end

% POSITIV PEAK
maxp_init = maxp(maxp(:,1) > minp_valid(1,1),:); %first pos peak to be after neg peak

maxp_a = t(maxp_init(2:end,1));
maxp_b = t(maxp_init(1:end-1,1));
mn_time_allow = mean(maxp_a - maxp_b)*t_allow_max; %how much time must be between peaks.
val = find((maxp_a - maxp_b) > mn_time_allow);
val = val + 1; %offset indices by one to align properly
maxp_valid = maxp_init(val, :);
maxp_valid = [maxp_init(1,:); maxp_valid]; %assume first is always valid - CHECK!
% 
% plot(t(maxp_valid(:,1)), data(maxp_valid(:,1)), 'sb')

% Actual movement data& plots peaks (useful for realtive phase analysis)
% figure(1)
% plot(t, mdata, 'k')
% title('Trial data z-axis')
% hold on
% plot(t(minp_valid(:,1)), mdata(minp_valid(:,1)), 'sb')
% plot(t(maxp_valid(:,1)), mdata(maxp_valid(:,1)), 'sr')
% hold off
% return data



%  if rubbish_str == 'y'
%      t_mins = final_annotations(:,1)';
%  else
    t_mins = [minp_valid(:,1), t(minp_valid(:,1)), minp_valid(:,2)]; %times of the neg peaks.
%  end
% t_maxs = t(maxp_valid(:,1)); %times of the pos peaks.
 t_maxs = [maxp_valid(:,1), t(maxp_valid(:,1)), maxp_valid(:,2)]; %times of the neg peaks.

