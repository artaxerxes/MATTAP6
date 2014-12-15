function [ok, savepath, analysis_file] = mattap_analyse_wrapper_v6_00(inc_xl, varargin)


max_xlrows = 100; %change this if you have more than 150 beats in sync and/or cont phase to stop mean & SD being overwritten.
stats_offs = 10; %number of rows after max_xlrows to put stats
cont_offs = 50; %number of rows after max_xlrows to cont phase data

if ~isempty(varargin)
    ev_file = varargin{1};
    fpath = varargin{2};
else
    [ev_file,fpath] = uigetfile('*_events_trial_*.mat', 'Select files for analysis', 'MultiSelect','on');
end
if ~iscell(ev_file) && ischar(ev_file) %one file selected returns char not cell - convert
    ev_file = cellstr(ev_file);
end

if ischar(fpath) && exist(fpath, 'file')
    cd(fpath);
    ev_path = fpath;
    cd('..\'); %up a level
    fpath = pwd;
    
    
    
    %analysis path
    if ~exist('analysis\', 'file')
        mkdir('analysis'); % make analysis dir in directory to store results
    end
    savepath = [fpath '\analysis\']; %save location
    
    %create analysed filename;
    rd_str = '_events_trial_';
    rd_ind = strfind(ev_file{1}, rd_str); %find the experiment name
    exp_name = ev_file{1}(1:rd_ind-1);
    
    %Look for conditions file in raw data
    fname_conds = [fpath '\raw_data\' exp_name '_conditions_list.csv']; %conditions list
    if exist(fname_conds, 'file')
        try
            fid=fopen(fname_conds,'rt');
            condstmp=fscanf(fid,'%c'); %Load in as a single string
            fclose(fid);
            
            n=0; %counter
            while ~isempty(condstmp)
                n = n + 1;
                [condsdat{n}, condstmp] = strtok(condstmp, char(10)); %separate each line
            end
            
            for cnt = 1:n-1
                [tr_n_tmp, rmn] = strtok(condsdat{cnt}, ','); %trial number
                cond_trn(cnt) = str2double(tr_n_tmp); %trial number
                [cond_str{cnt}, rmn] = strtok(rmn, ','); %condition string label
                [cond_date{cnt}, rmn] = strtok(rmn, ','); %date and time (not used)
            end
            
        catch ME
            disp(ME.message);
            disp('Failed to read condition labels from Conditions List file');
            cond_trn = []; %empty
        end
    else
        disp('Failed to read condition labels from Conditions List file');
        cond_trn = []; %empty
    end
    
    %%%%%%%%%%% save xls %%%%%%%%%%%%%%
    try
        warning('off', 'MATLAB:xlswrite:AddSheet'); %turn off warnings
        
        if inc_xl %if Excel save selected open the spreadsheet file ready
            xlfile = [exp_name '_results.xlsx'];
            
            File = [savepath xlfile]; %open EXCEL FILE
            Excel = actxserver('Excel.Application');
            if ~exist(File,'file')
                ExcelWorkbook = Excel.workbooks.Add;
                ExcelWorkbook.SaveAs(File)
                ExcelWorkbook.Close(false);
            end
            ExcelWorkbook = Excel.workbooks.Open(File);
        end
        
        for cnt = 1:length(ev_file)
            if exist([ev_path ev_file{cnt}], 'file') %check events file exists
                load([ev_path ev_file{cnt}]);
                disp(['Loaded data from: ' ev_file{cnt}]);
                file_exist = true;
                
                [res, xl] = mattap_analyse_v6_00(stimulus, all_onsets, max_en); %call analyse function
                
                %extract trial number and create new filename for analysis
                %files
                tr_cnt = ev_file{cnt}(rd_ind + length(rd_str):strfind(ev_file{cnt}, '.mat')-1); %get trial number
                an_file{cnt} = [exp_name '_analyses_trial_' tr_cnt '.mat']; %new filename for saving events
                analysis_file = [savepath an_file{cnt}];
                
                lbl_ind = find(cond_trn == str2double(tr_cnt)); %find label entry for this trial
                if ~isempty(lbl_ind)
                    tr_label = cond_str{lbl_ind(1)}; %assign label
                else
                    tr_label = {''};
                end
                
                
                
                save(analysis_file, 'tr_label', 'res', 'stimulus'); %save data in matlab format
                
                
                
                if inc_xl %if excel file selected then save data
                    for tabn = 1:length(xl.IRItab)
                        % Get last column
                        try
                            [xn, xt, xraw] = xlsread1(File, xl.IRItab{tabn});
                            if ischar(xraw) %if only header text then read as char
                                xraw = cellstr(xraw); %need to convert to cellstr
                            end %so it doesn't just count chars!
                            nxt_col = size(xraw, 2)+1; %get number of columns +1
                        catch
                            %                         disp('Sheet doesnt exist: start col = 1');
                            nxt_col = 1;
                        end
                        
                        %write data
                        
                        %IRI Data
                        %Sync Phase
                        if ~isempty(xl.IRIDat_sync{tabn})
                            xlswrite1(File, xl.IRIDat_sync{tabn}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(4)]);
                            xlswrite1(File, {'Mean/SD'}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + stats_offs-1)]);
                            xlswrite1(File, xl.IRIStats_sync{tabn}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + stats_offs)]);
                        end
                        
                        
                        %Continuation Phase
                        if ~isempty(xl.IRIDat_cont{tabn})
                            xlswrite1(File, xl.IRIDat_cont{tabn}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(4+max_xlrows+cont_offs)]);
                            xlswrite1(File, {'Mean/SD'}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(2*max_xlrows + cont_offs + stats_offs-1)]);
                            xlswrite1(File, xl.IRIStats_cont{tabn}, xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(2*max_xlrows + cont_offs + stats_offs)]);
                            xlswrite1(File, [{'Continuation'}; {''}; {''}], xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows+cont_offs-1)]);
                            xlswrite1(File, [{['Trial_' tr_cnt]}; tr_label; {''}], xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows+cont_offs)]);
                        end
                        
                        %write the headers - sync phase - last
                        %so file closes at top of the screen
                        xlswrite1(File, [{['Trial_' tr_cnt]}; tr_label; {''}], xl.IRItab{tabn}, [char(ExcelCol(nxt_col)) num2str(1)]);
                        
                    end
                    
                    
                    for tabn = 1:length(xl.Asytab)
                        % Get last column
                        try
                            [xn, xt, xraw] = xlsread1(File, xl.Asytab{tabn});
                            if ischar(xraw) %if only header text then read as char
                                xraw = cellstr(xraw); %need to convert to cellstr
                            end %so it doesn't just count chars!
                            nxt_col = size(xraw, 2)+1; %get number of columns +1
                        catch
                            %                         disp('Sheet doesnt exist: start col = 1');
                            nxt_col = 1;
                        end
                        
                        if ~isempty(xl.AsyDat_sync{tabn})
                            xlswrite1(File, xl.AsyDat_sync{tabn}, xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(4)]);
                            xlswrite1(File, {'Mean/SD'}, xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + stats_offs-1)]); % stats
                            xlswrite1(File, xl.AsyStats_sync(:, tabn), xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + stats_offs)]); % stats
                        end
                        
                        if ~isempty(xl.AsyDat_cont{tabn})
                            xlswrite1(File, xl.AsyDat_cont{tabn}, xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows+cont_offs + 4)]);
                            xlswrite1(File, {'Mean/SD'}, xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(2*max_xlrows + cont_offs + stats_offs-1)]);
                            xlswrite1(File, xl.AsyStats_cont(:, tabn), xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(2*max_xlrows + cont_offs + stats_offs)]);
                            xlswrite1(File, [{'Continuation'}; {''}; {''};], xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + cont_offs-1)]);
                            xlswrite1(File, [{['Trial_' tr_cnt]}; tr_label; {''};], xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(max_xlrows + cont_offs)]);
                        end
                        xlswrite1(File, [{['Trial_' tr_cnt]}; tr_label; {''};], xl.Asytab{tabn}, [char(ExcelCol(nxt_col)) num2str(1)]); %write header last so file closes at top of screen
                    end
                end
                
                
                
            end
        end
    catch %close excel nicely
        ExcelWorkbook.Save
        ExcelWorkbook.Close(false) % Close Excel workbook.
        Excel.Quit;
        delete(Excel);
    end
    
    ok = 1;
    if inc_xl %if excel file was saved close it
        try
            ExcelWorkbook.Save
            ExcelWorkbook.Close(false) % Close Excel workbook.
            Excel.Quit;
            delete(Excel);
           
        catch
            ok=0;
        end
    end
    
else
    if ~ischar(fpath) && fpath == 0
        ok = -1; %don't raise error if just cancelled
    else
        ok = 0; 
    end
    savepath = []; 
    analysis_file = [];
    
end

    
    
