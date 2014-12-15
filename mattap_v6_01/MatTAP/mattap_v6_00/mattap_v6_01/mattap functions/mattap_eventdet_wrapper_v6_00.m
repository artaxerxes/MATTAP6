function [ok, eventspath, ev_file] = mattap_eventdet_wrapper_v6_00(event_type, visual_on)
% OK flag: 
% 1 = all went well
% 0 = Error occurred
% -1 = User cancelled
% -2 = User chose not to save


ok =1;
% try
[tr_file,fpath] = uigetfile('*_rd_trial*.mat', 'Select files for analysis', 'MultiSelect','on');

if ~iscell(tr_file) && ischar(tr_file)  %one file selected returns char not cell - convert, cancel returns a number!
    tr_file = cellstr(tr_file);
end

if ischar(fpath) && exist(fpath, 'file')
    cd(fpath);
    rd_path = fpath; %raw data
    cd('..'); %move up to experiment path level
    fpath = [pwd '\'];
    
    
 
    %events path
    if ~exist([fpath 'events\'], 'file')
        mkdir([fpath 'events\']); % make analysis dir in directory above to store results
    end
    eventspath = [fpath 'events\']; %events file location
    
    
    
    for f=1:length(tr_file) %for each file selected
        if exist([rd_path tr_file{f}])
            raw= load([rd_path tr_file{f}]);
            disp(['Loaded data from: ' tr_file{f}]);
            
            %Extract Events;
            rd_str = '_rd_trial_';
            rd_ind = strfind(tr_file{f}, '_rd_trial_'); %find the experiment name
            tr_cnt = tr_file{f}(rd_ind + length(rd_str):strfind(tr_file{f}, '.mat')-1); %get trial number
            ev_file{f} = [tr_file{f}(1:rd_ind-1) '_events_trial_' tr_cnt '.mat']; %new filename for saving events
            events_file = [eventspath ev_file{f}];
            
            if exist(events_file, 'file') %pre defined stim markers
                disp('Events file already exists');
                trial_exist = true;
            else
                trial_exist = false;
                [stimulus, all_onsets, daq_delay] = mattap_eventdetect_v6_00(raw, event_type, visual_on);
                
                if visual_on
                    button = questdlg('Save the extracted events for this trial?','Save events?','Yes','No','Yes');
                end
                if ~visual_on || strcmp(button, 'Yes')
                    max_en = raw.max_en;
                    Fs = raw.Fs;
                    saved_event_type = event_type; 
                    save(events_file, 'stimulus', 'max_en', 'Fs', 'all_onsets', 'daq_delay', 'saved_event_type');
                else
                    ok = -2; %another flag setting to show file not saved
                end
            end
        else
            errordlg('File does not exist');
            ok = 0;
        end
    end
else
    if ~ischar(fpath) && fpath == 0;
        ok = -1;
    else
        ok = 0;
        errordlg('Path does not exist');
    end
    eventspath = []; %return empty
    ev_file = []; 
end

% catch
%     ok= 0;
%     disp('ERROR in Event Detection');
% end