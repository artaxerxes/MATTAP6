function fig_hdl = mattap_v6_01
% MATTAP_v6_00
%-------------------------------------------------------------------------------
% File name   : mattap_v6_00.m
% Copyright 2007-2013 University of Birmingham, UK
% Authors: Mark Elliott, Dagmar Fraser. School of Psychology, University of
% Birmingham, UK.
% Generated on: -January 2013
% Description : MatTAP v6.0.
% Changes:  Fully revised for Timely COST Tutorial! Improved H/W
% interfacing, improved analysis
% 
%
% FOR HELP: go to http://snipurl.com/mattap to download the user guide. Or
% email mattap.info@gmail.com with bug reports and suggestions.

%-------------------------------------------------------------------------------

% global vars
warning off MATLAB:childAddedCbk:CallbackWillBeOverwritten; %Turn off radio button warning
Mt_ver = 'MatTAP v6.0'; %For GUI Window title



%-------------------------------------------------------------------------
%% GUI Construction functions
%-------------------------------------------------------------------------

% --- FIGURE -------------------------------------
handles.figure1 = figure(	'Tag', 'figure1', ...
    'Units', 'pixels', ...
    'Position', [400 0 660 550], ...
    'Name', Mt_ver, ...
    'MenuBar', 'none', ...
    'NumberTitle', 'off', ...
    'Color', get(0,'DefaultUicontrolBackgroundColor'));

movegui('center'); %Center GUI

% --- PANELS -------------------------------------

%Main Panels
handles.pnl_metro = uipanel(	'Parent', handles.figure1, ...
    'Tag', 'pnl_metro', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 10 640 480], ...
    'Title', '', 'Visible', 'Off');

handles.pnl_auto = uipanel(	'Parent', handles.figure1, ...
    'Tag', 'pnl_auto', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 10 640 500], ...
    'Title', '', 'Visible', 'Off');

handles.pnl_file = uibuttongroup(	'Parent', handles.figure1, ...
    'Tag', 'pnl_file', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 10 640 500], ...
    'Title', '');


% Metronome 1 Panel
handles.pnl_m1 = uipanel(	'Parent', handles.pnl_metro, ...
    'Tag', 'pnl_m1', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 95 200 350], ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'Title', 'Metronome 1');

% Metronome 2 Panel
handles.pnl_m2 = uipanel(	'Parent', handles.pnl_metro, ...
    'Tag', 'pnl_m1', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [220 95 200 350], ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'Visible', 'off',...
    'Title', 'Metronome 2');

handles.uipanel3 = uibuttongroup(	'Parent', handles.pnl_m1, ...
    'Tag', 'uipanel3', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [5 5 185 170], ...
    'Title', 'Insert Phase Shift');

%for enable flag 1
handles.uipanel10 = uibuttongroup(	'Parent', handles.pnl_metro, ...
    'Tag', 'uipanel10', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 450 200 25], ...
    'Title', '');

%for enable flag 1
handles.uipanel210 = uibuttongroup(	'Parent', handles.pnl_metro, ...
    'Tag', 'uipanel210', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [220 450 200 25], ...
    'Title', '');

handles.uipanel14 = uibuttongroup(	'Parent', handles.pnl_metro, ...
    'Tag', 'uipanel14', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [430 298 200 145], ...
    'Title', 'Trial Control');

handles.uipanel17 = uibuttongroup(	'Parent', handles.pnl_metro, ...
    'Tag', 'uipanel17', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [430 97 200 180], ...
    'Title', 'General Parameters');

% METRONOME 1 PARAMETERS

handles.text1 = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'text1', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 304 80 22], ...
    'String', 'Tone Freq.', ...
    'HorizontalAlignment', 'right');

handles.text2 = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'text2', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 276 80 22], ...
    'String', 'Mean ISI (ms)', ...
    'HorizontalAlignment', 'right');

handles.text3 = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'text3', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 248 80 22], ...
    'String', 's.d. ISI (ms)', ...
    'HorizontalAlignment', 'right');

handles.text4 = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'text4', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 220 80 22], ...
    'String', 'Tone Dur. (ms)', ...
    'HorizontalAlignment', 'right');

handles.edt_beep_f = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'edt_beep_f', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 304 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '700', ...
    'Enable', 'on', ...
    'Callback', @edt_beep_f_Callback, ...
    'CreateFcn', @edt_beep_f_CreateFcn);

handles.edt_mn_isi = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'edt_mn_isi', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 276 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '500', ...
    'Callback', @edt_mn_isi_Callback, ...
    'CreateFcn', @edt_mn_isi_CreateFcn);

handles.edt_sd_isi = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'edt_sd_isi', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 248 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_sd_isi_Callback, ...
    'CreateFcn', @edt_sd_isi_CreateFcn);

handles.edt_beep_len = uicontrol(	'Parent', handles.pnl_m1, ...
    'Tag', 'edt_beep_len', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 220 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '30', ...
    'Callback', @edt_beep_len_Callback, ...
    'CreateFcn', @edt_beep_len_CreateFcn);

%PHASE SHIFT PARAMETERS

handles.text12 = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'text12', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 130 75 15], ...
    'HorizontalAlignment', 'right', ...
    'String', 'Insert at interval No. ');

handles.text13 = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'text13', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 105 75 15], ...
    'HorizontalAlignment', 'right', ...
    'String', 'Size (% ISI)');

handles.edt_shift_pos = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'edt_shift_pos', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [95 130 80 20], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_shift_pos_Callback, ...
    'CreateFcn', @edt_shift_pos_CreateFcn);

handles.edt_shift_size = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'edt_shift_size', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [95 105 80 20], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_shift_size_Callback, ...
    'CreateFcn', @edt_shift_size_CreateFcn);

handles.tck_neg_shift = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'tck_neg_shift', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [80 70 100 20], ...
    'String', 'Negative shift', ...
    'Callback', @tck_neg_shift_Callback);

handles.tck_per_shift = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'tck_per_shift', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [80 45 100 20], ...
    'String', 'Period shift', ...
    'Callback', @tck_per_shift_Callback);

handles.btn_insert_shift = uicontrol(	'Parent', handles.uipanel3, ...
    'Tag', 'btn_insert_shift', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'Position', [40 10 100 25], ...
    'String', 'Insert', ...
    'Callback', @btn_insert_shift_Callback);



% GENERAL PARAMETERS

handles.text6 = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'text6', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 135 85 22], ...
    'String', 'Sample Freq.', ...
    'HorizontalAlignment', 'right');

handles.text5 = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'text5', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [1 104 90 22], ...
    'String', 'No. of stimuli ', ...
    'HorizontalAlignment', 'right');

handles.text14 = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'text14', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [1 75 90 22], ...
    'String', 'Min Silence (secs)', ...
    'HorizontalAlignment', 'right');


handles.edt_Fs = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'edt_Fs', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 135 85 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '10000', ...
    'Callback', @edt_Fs_Callback, ...
    'CreateFcn', @edt_Fs_CreateFcn);

handles.edt_num_beeps1 = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'edt_num_beeps1', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 107 40 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '30', ...
    'Callback', @edt_num_beeps_Callback, ...
    'CreateFcn', @edt_num_beeps_CreateFcn);

handles.edt_num_beeps2 = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'edt_num_beeps2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [145 107 40 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '30', ...
    'Enable', 'off', ...
    'Callback', @edt_num_beeps_Callback, ...
    'CreateFcn', @edt_num_beeps_CreateFcn);

%Limited to 2 metronomes in this version...

% handles.edt_num_beeps3 = uicontrol(	'Parent', handles.uipanel17, ...
%     'Tag', 'edt_num_beeps3', ...
%     'UserData', [], ...
%     'Style', 'edit', ...
%     'Units', 'pixels', ...
%     'Position', [142 107 20 22], ...
%     'BackgroundColor', [1 1 1], ...
%     'String', '30', ...
%     'Enable', 'off', ...
%     'Callback', @edt_num_beeps_Callback, ...
%     'CreateFcn', @edt_num_beeps_CreateFcn);
% 
% handles.edt_num_beeps4 = uicontrol(	'Parent', handles.uipanel17, ...
%     'Tag', 'edt_num_beeps4', ...
%     'UserData', [], ...
%     'Style', 'edit', ...
%     'Units', 'pixels', ...
%     'Position', [163 107 20 22], ...
%     'BackgroundColor', [1 1 1], ...
%     'String', '30', ...
%     'Enable', 'off', ...
%     'Callback', @edt_num_beeps_Callback, ...
%     'CreateFcn', @edt_num_beeps_CreateFcn);

handles.edt_silence = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'edt_silence', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 79 85 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_silence_Callback, ...
    'CreateFcn', @edt_silence_CreateFcn);


handles.btn_generate = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'btn_generate', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [1.8 1 35 2.93], ...
    'FontName', 'Arial', ...
    'FontSize', 12, ...
    'FontWeight', 'bold', ...
    'String', 'Start Trial', ...
    'Callback', @btn_generate_Callback);

handles.txt_daq_stat = uicontrol(	'Parent', handles.uipanel17, ...
    'Tag', 'txt_daq_stat', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'Position', [1.8 4.1 35 1.4], ...
    'String', '');


% TRIAL CONTROL

handles.txt_exp_scr = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'txt_exp_scr', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'Position', [2.2 7.8 35 1.69230769230769], ...
    'BackgroundColor', [1 1 1], ...
    'String', '', ...
    'Callback', @txt_exp_scr_Callback, ...
    'CreateFcn', @txt_exp_scr_CreateFcn);

handles.txt_scr_pos = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'txt_scr_pos', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'Position', [16 1.7 7.3 1], ...
    'ForegroundColor', [0 0 1], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0');

handles.btn_script = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'btn_script', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [2.2 4.8 17 1.8], ...
    'String', 'Select Script', ...
    'Callback', @btn_script_Callback);

handles.btn_clr_script = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'btn_clr_script', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [20.3 4.8 17 1.8], ...
    'String', 'Clear Script', ...
    'Callback', @btn_clr_script_Callback);

handles.btn_prev = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'btn_prev', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [2.2 1 13 2.53], ...
    'FontName', 'Arial', ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'String', '<< Prev', ...
    'Enable', 'off', ...
    'Callback', @btn_prev_Callback);

handles.btn_next = uicontrol(	'Parent', handles.uipanel14, ...
    'Tag', 'btn_next', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [24.3 1 13 2.53], ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'String', 'Next >>', ...
    'Enable', 'off', ...
    'Callback', @btn_next_Callback);





%Auto panel - Trial number
handles.txt_auto_scr_pos = uicontrol(	'Parent', handles.pnl_auto, ...
    'Tag', 'txt_auto_scr_pos', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'FontName', 'Arial', ...
    'FontSize', 30, ...
    'FontWeight', 'bold', ...
    'Position', [10 25 95 5.69230769230769], ...
    'String', '', ...
    'Callback', @txt_auto_scr_pos_Callback);

handles.txt_daq_stat_auto = uicontrol(	'Parent', handles.pnl_auto, ...
    'Tag', 'txt_daq_stat_auto', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'Position', [1 1 35 1.4], ...
    'String', '');

%Auto Pause button

handles.btn_auto_pause = uicontrol(	'Parent', handles.pnl_auto, ...
    'Tag', 'btn_auto_pause', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [21 15 80 4.92307692307692], ...
    'FontName', 'Arial', ...
    'FontSize', 20, ...
    'FontWeight', 'bold', ...
    'String', 'Paused, Click to Continue', ...
    'Callback', @btn_auto_pause_Callback);


%Enable Check boxes

handles.tck_enable_m1 = uicontrol(	'Parent', handles.uipanel10, ...
    'Tag', 'tck_enable_m1', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [5 3 150 15], ...
    'FontName', 'arial', ...
    'FontSize', 9, ...
    'FontWeight', 'bold', ...
    'Value', 1, ...
    'Enable', 'off', ...
    'String', 'Enable Metronome 1', ...
    'Callback', @tck_enable_m1_Callback);

handles.tck_enable_m2 = uicontrol(	'Parent', handles.uipanel210, ...
    'Tag', 'tck_enable_m2', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [130 3 60 15], ...
    'FontName', 'arial', ...
    'FontSize', 9, ...
    'FontWeight', 'bold', ...
    'Value', 0, ...
    'Enable', 'on', ...
    'String', 'Enable', ...
    'Callback', @tck_enable_m2_Callback);

handles.pop_metro_select = uicontrol(	'Parent', handles.uipanel210, ...
    'Tag', 'pop_metro_select', ...
    'UserData', [], ...
    'Style', 'popup', ...
    'Units', 'pixels', ...
    'Position', [3 12 115 10], ...
    'FontName', 'arial', ...
    'FontSize', 9, ...
    'Value', 1, ...
    'Enable', 'on', ...
    'String', {'Metronome 2 [Same Channel]', 'Metronome 2 [Separate Channel]'}, ... 
    'Callback', @pop_metro_select_Callback);

%Live Analysis

%Live Analysis info box
handles.pnl_live_analysis = uibuttongroup(	'Parent', handles.pnl_metro, ...
    'Tag', 'pnl_live_analysis', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 10 620 80], ...
    'Title', 'Live Analysis');


handles.txt_live_analysis = uicontrol(	'Parent', handles.pnl_live_analysis, ...
    'Tag', 'txt_live_analysis', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'FontName', 'Courier', ...
    'FontSize', 8, ...
    'Position', [1 0.2 120 4], ...
    'HorizontalAlignment', 'left', ...
    'String', '<No Data>'); %, .. .
%'Callback', @txt_auto_scr_pos_Callback);






% ################## FILE PANEL ################################

handles.uipanel15 = uipanel(	'Parent', handles.pnl_file, ...
    'Tag', 'uipanel15', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [35 215 570 275], ...
    'Title', '');

handles.uipanelanalysis = uipanel(	'Parent', handles.pnl_file, ...
    'Tag', 'uipanelanalysis', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [325 25 281 185], ...
    'Title', 'Analysis Options');

handles.uipanelanchn = uipanel(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'uipanelanchn', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 72 260 59], ...
    'Title', 'Event Detection Method');

handles.uipanelangen = uipanel(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'uipanelangen', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [10 10 260 60], ...
    'Title', 'General');

% --- AXES -------------------------------------
handles.axes1 = axes(	'Parent', handles.pnl_file, ...
    'Tag', 'axes1', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [35 25 285 165]);


%-----ANALYSIS OPTIONS------

handles.btn_eventdet = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'btn_eventdet', ...
    'UserData', zeros(1,0), ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [6 10.7 20 2.0], ...
    'FontWeight', 'bold', ...
    'String', 'Event Detect', ...
    'CData', zeros(1,0), ...
    'Callback', @btn_eventdet_Callback);

handles.btn_analyse = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'btn_analyse', ...
    'UserData', zeros(1,0), ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [30 10.7 20 2.0], ...
    'FontWeight', 'bold', ...
    'String', 'Analyse', ...
    'CData', zeros(1,0), ...
    'Callback', @btn_analyse_Callback);

handles.txt_channel = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'txt_channel', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'characters', ...
    'Position', [5 7.8 45 1], ...
    'FontWeight', 'bold', ...
    'HorizontalAlignment', 'left',...
    'String', 'Input 1                            Input 2 ');


handles.pop_eventdet_tap1 = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'pop_eventdet_tap1', ...
    'UserData', [], ...
    'Style', 'popup', ...
    'Units', 'characters', ...
    'Position', [5 -2.3 20 10], ...
    'FontName', 'arial', ...
    'FontSize', 9, ...
    'Value', 1, ...
    'Enable', 'on', ...
    'String', 'Onset|Peak|Trough', ... %add metronome 3, metronome 4 if req'd
    'Callback', @an_options_Callback);

handles.pop_eventdet_tap2 = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'pop_eventdet_tap2', ...
    'UserData', [], ...
    'Style', 'popup', ...
    'Units', 'characters', ...
    'Position', [30 -2.3 20 10], ...
    'FontName', 'arial', ...
    'FontSize', 9, ...
    'Value', 1, ...
    'Enable', 'on', ...
    'String', 'Onset|Peak|Trough', ... %add metronome 3, metronome 4 if req'd
    'Callback', @an_options_Callback);

% handles.txt_eventdet = uicontrol(	'Parent', handles.uipanelanalysis, ...
%     'Tag', 'txt_eventdet', ...
%     'UserData', [], ...
%     'Style', 'text', ...
%     'Units', 'characters', ...
%     'Position', [45 8.4 8 2], ...
%     'FontWeight', 'bold', ...
%     'String', 'Event Detect');


handles.tck_inc_xl = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'tck_inc_xl', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'characters', ...
    'Position', [4 1 35 1.85], ...
    'String', 'Output to Excel', ...
    'Value', 1, ...
    'Callback', @an_options_Callback);

handles.tck_vischk = uicontrol(	'Parent', handles.uipanelanalysis, ...
    'Tag', 'tck_vischk', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'characters', ...
    'Position', [4 2.5 35 1.85], ...
    'String', 'Include Visual Check', ...
    'Value', 1, ...
    'Callback', @an_options_Callback);



% --- STATIC TEXTS -------------------------------------




handles.text24 = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'text24', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [240, 190, 150, 30], ...
    'FontWeight', 'bold', ...
    'String', 'Trials');

handles.text23 = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'text23', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'FontWeight', 'bold', ...
    'Position', [15 190 150 30], ...
    'String', 'Experiment/Subject ID');

% -- BUTTONS -----------------------
handles.btn_new_exp = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'btn_new_exp', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [40 1.5 14 1.84615384615385], ...
    'FontWeight', 'bold', ...
    'String', 'New Exp', ...
    'Callback', @btn_new_exp_Callback);

handles.btn_set_path = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'btn_set_path', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'FontWeight', 'bold', ...
    'Position', [30 235 80 25], ...
    'String', 'Set Path', ...
    'Callback', @btn_set_path_Callback);

handles.btn_refresh_list = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'btn_refresh_list', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'characters', ...
    'Position', [60 1.5 15 2.0], ...
    'FontWeight', 'bold', ...
    'String', 'Refresh', ...
    'Callback', @btn_refresh_list_Callback);


% -- EDIT BOXES --

handles.edt_new_exp = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'edt_new_exp', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'characters', ...
    'Position', [5.4 1.5 33 1.84615384615385], ...
    'BackgroundColor', [1 1 1], ...
    'String', '', ...
    'Callback', @edt_new_exp_Callback, ...
    'CreateFcn', @edt_new_exp_CreateFcn);

handles.edt_work_path = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'edt_work_path', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [120 235 420 25], ...
    'BackgroundColor', [1 1 1], ...
    'String', pwd, ...
    'Callback', @edt_work_path_Callback, ...
    'CreateFcn', @edt_work_path_CreateFcn);

% --- LISTBOXES -------------------------------------
handles.list_exp = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'list_exp', ...
    'UserData', [], ...
    'Style', 'listbox', ...
    'Units', 'pixels', ...
    'Position', [29 55 240 150], ...
    'BackgroundColor', [1 1 1], ...
    'String', {'<No Experiments>'}, ...
    'Callback', @list_exp_Callback, ...
    'CreateFcn', @list_exp_CreateFcn);

handles.list_trial = uicontrol(	'Parent', handles.uipanel15, ...
    'Tag', 'list_trial', ...
    'UserData', [], ...
    'Style', 'listbox', ...
    'Units', 'pixels', ...
    'Position', [300 55 240 150], ...
    'BackgroundColor', [1 1 1], ...
    'String', '<Empty>', ...
    'Callback', @list_trial_Callback, ...
    'CreateFcn', @list_trial_CreateFcn);



% MATTAP COPYRIGHT TEXT

handles.txt_title = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'txt_title', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [280 517 100 30], ...
    'FontName', 'Calibri', ...
    'FontSize', 15, ...
    'FontWeight', 'bold', ...
    'String', 'MatTAP');

handles.text26 = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'text26', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [370 517 220 25], ...
    'FontName', 'Arial', ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'ForegroundColor', [0 0.251 0.502], ...
    'String', 'Matlab Timing Analysis Package');

handles.text25 = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'text25', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [280 510 320 13], ...
    'FontName', 'Arial', ...
    'ForegroundColor', [0.502 0.502 0.502], ...
    'String', 'Copyright 2007-2013 University of Birmingham, UK.');



% Main TAB BUTTONS

handles.btn_file = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'btn_file', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'Position', [10 515 85 30], ...
    'FontName', 'Arial', ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'String', 'File', ...
    'Enable', 'off', ...
    'Callback', @btn_file_Callback);

handles.btn_metro = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'btn_metro', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'Position', [100 515 85 30], ...
    'FontName', 'Arial', ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'String', 'Metronome', ...
    'Callback', @btn_metro_Callback);

handles.btn_auto = uicontrol(	'Parent', handles.figure1, ...
    'Tag', 'btn_auto', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'Position', [190 515 85 30], ...
    'FontName', 'Arial', ...
    'FontSize', 10, ...
    'FontWeight', 'bold', ...
    'String', 'Auto', ...
    'Callback', @btn_auto_Callback);






%% CREATE M2 GUI Panel

% Generates panel for controlling metronome 2
% M. Elliott 03/06/08



handles.uipanel9 = uibuttongroup(	'Parent', handles.pnl_m2, ...
    'Tag', 'uipanel3', ...
    'UserData', [], ...
    'Units', 'pixels', ...
    'Position', [5 5 185 170], ...
    'Title', 'Insert Phase Shift');


% METRONOME 2 PARAMETERS

handles.text21 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'text21', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 304 80 22], ...
    'String', 'Tone Freq.', ...
    'HorizontalAlignment', 'right');

handles.text22 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'text22', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 276 80 22], ...
    'String', 'Mean ISI (ms)', ...
    'HorizontalAlignment', 'right');

handles.text23 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'text23', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 248 80 22], ...
    'String', 's.d. ISI (ms)', ...
    'HorizontalAlignment', 'right');

handles.text24 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'text24', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 220 80 22], ...
    'String', 'Tone Dur. (ms)', ...
    'HorizontalAlignment', 'right');

handles.text25 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'text25', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 192 80 22], ...
    'String', 'Offset (ms)', ...
    'HorizontalAlignment', 'right');

handles.edt_beep_f_m2 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'edt_beep_f_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 304 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '700', ...
    'Enable', 'on', ...
    'Callback', @edt_beep_f_m2_Callback, ...
    'CreateFcn', @edt_beep_f_m2_CreateFcn);

handles.edt_mn_isi_m2 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'edt_mn_isi_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 276 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '500', ...
    'Callback', @edt_mn_isi_m2_Callback, ...
    'CreateFcn', @edt_mn_isi_m2_CreateFcn);

handles.edt_sd_isi_m2 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'edt_sd_isi_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 248 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_sd_isi_m2_Callback, ...
    'CreateFcn', @edt_sd_isi_m2_CreateFcn);

handles.edt_beep_len_m2 = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'edt_beep_len_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 220 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '30', ...
    'Callback', @edt_beep_len_m2_Callback, ...
    'CreateFcn', @edt_beep_len_m2_CreateFcn);


handles.edt_m2_offset = uicontrol(	'Parent', handles.pnl_m2, ...
    'Tag', 'edt_m2_offset', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [100 192 80 22], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_m2_offset_Callback, ...
    'CreateFcn', @edt_m2_offset_CreateFcn);

%PHASE SHIFT PARAMETERS

handles.text212 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'text212', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 130 75 15], ...
    'HorizontalAlignment', 'right', ...
    'String', 'Insert at interval No. ');

handles.text213 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'text213', ...
    'UserData', [], ...
    'Style', 'text', ...
    'Units', 'pixels', ...
    'Position', [5 105 75 15], ...
    'HorizontalAlignment', 'right', ...
    'String', 'Size (% ISI)');

handles.edt_shift_pos_m2 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'edt_shift_pos_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [95 130 80 20], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_shift_pos_m2_Callback, ...
    'CreateFcn', @edt_shift_pos_m2_CreateFcn);

handles.edt_shift_size_m2 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'edt_shift_size_m2', ...
    'UserData', [], ...
    'Style', 'edit', ...
    'Units', 'pixels', ...
    'Position', [95 105 80 20], ...
    'BackgroundColor', [1 1 1], ...
    'String', '0', ...
    'Callback', @edt_shift_size_m2_Callback, ...
    'CreateFcn', @edt_shift_size_m2_CreateFcn);

handles.tck_neg_shift_m2 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'tck_neg_shift_m2', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [80 70 100 20], ...
    'String', 'Negative shift', ...
    'Callback', @tck_neg_shift_m2_Callback);

handles.tck_per_shift_m2 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'tck_per_shift_m2', ...
    'UserData', [], ...
    'Style', 'checkbox', ...
    'Units', 'pixels', ...
    'Position', [80 45 100 20], ...
    'String', 'Period shift', ...
    'Callback', @tck_per_shift_m2_Callback);

handles.btn_insert_shift_m2 = uicontrol(	'Parent', handles.uipanel9, ...
    'Tag', 'btn_insert_shift_m2', ...
    'UserData', [], ...
    'Style', 'pushbutton', ...
    'Units', 'pixels', ...
    'Position', [40 10 100 25], ...
    'String', 'Insert', ...
    'Callback', @btn_insert_shift_m2_Callback);






% handles.edt_shift_pos_m2 = uicontrol(	'Parent', handles.uipanel9, ...
%     'Tag', 'edt_shift_pos_m2', ...
%     'UserData', [], ...
%     'Style', 'edit', ...
%     'Units', 'characters', ...
%     'Position', [26.2 7.07692307692307 13.8 1.85], ...
%     'BackgroundColor', [1 1 1], ...
%     'String', '10', ...
%     'Callback', @edt_shift_pos_m2_Callback, ...
%     'CreateFcn', @edt_shift_pos_m2_CreateFcn);
%
% handles.edt_shift_size_m2 = uicontrol(	'Parent', handles.uipanel9, ...
%     'Tag', 'edt_shift_size_m2', ...
%     'UserData', [], ...
%     'Style', 'edit', ...
%     'Units', 'characters', ...
%     'Position', [26.2 4.5 13.8 1.85], ...
%     'BackgroundColor', [1 1 1], ...
%     'String', '5', ...
%     'Callback', @edt_shift_size_m2_Callback, ...
%     'CreateFcn', @edt_shift_size_m2_CreateFcn);


%---------------------------------------------------------------------
% Save handles structure
guidata(handles.figure1,handles);

% Assign function output
%fig_hdl = handles.figure1;
fig_hdl = 'MatTAP is up and running...';

%% hdata vars
hdata = guidata(handles.figure1); %retrieve gui data
hdata.work_dir = pwd;
hdata.dir_prefix = '_tt_'; %All subject folders are to be prefixed by this.
hdata.rd_prefix = '_rd_';  %raw data file prefix
hdata.ons_prefix = '_ons_'; %onset file prefix.
hdata.mod_prefix = '_mod_'; %prefix for model output files.

hdata.auto_pause = 1; %user pause (auto mode) - active.
hdata.num_trials = 0; %initialise num_trials until refreshed.
hdata.inc_xl = 1; %flag to generate excel files in analysis
hdata.max_metro = 2; %maximum metronomes
hdata.metronome = cell(hdata.max_metro,1); %create cell structure for upto 4 metronomes
hdata.metro_sel = 2; %starts on 2nd metronome
hdata.shifts = cell(hdata.max_metro,1); %empty cell var for phase shifts
hdata.fields_per_m = 12; %number of fields for each metro in auto script


hdata.eventtype = [0 0]; %onset detection for event detection
hdata.visual_on = 1; %Visually check the data after event detection
hdata.inc_xl = 1; %Out analysis to Excel
hdata.file_cond = {''}; %file condition label

for mm = 1:length(hdata.metronome)
    hdata.metronome{mm} = struct('active', 0, 'toneFreq', 700, 'isi', 500, 'isi_sd', 0,...
        'toneDur', 30, 'offset', 0, 'phasePos', 0, 'phaseSize', 0,...
        'phaseNeg', 0, 'phasePeriod', 0, 'numBeeps', 30, 'secsSilence', 0); %create variable struct for each metronome
end

hdata.metronome{1}.active = 1; %Metronome 1 always active.



if exist('trial_complete.wav', 'file')
    [hdata.wav_trial, hdata.wav_f, wav_n] = wavread('trial_complete.wav'); %load audio voice
else
    hdata.wav_trial = 0; %dummy value to stop crash
    hdata.wav_f = 1000;
end

if exist('exp_complete.wav', 'file')
    hdata.wav_exp = wavread('exp_complete.wav'); %load audio voice
else
    hdata.wav_exp = 1000; %dummy value to stop crash
end

if exist('next_cntdown.wav', 'file')
    [hdata.wav_cntdn, hdata.wav_f, wav_n] = wavread('next_cntdown.wav'); %load audio voice
else
    hdata.wav_cntdn = 0; %dummy value to stop crash
    hdata.wav_f = 1000;
end

guidata(handles.figure1, hdata); %save gui data
btn_refresh_list_Callback(handles.figure1,[])

    function btn_auto_pause_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        if hdata.auto_pause == 0
            hdata.auto_pause = 1; %activate pause
            guidata(hObject, hdata);
            set(handles.btn_auto_pause, 'String', 'Paused, Click to Continue'); %change button string
        else
            hdata.auto_pause = 0; %deactivate pause
            guidata(hObject, hdata);
            set(handles.btn_auto_pause, 'String', 'Pause');
            wavplay(hdata.wav_cntdn, hdata.wav_f, 'async'); %play audio voice
            pause(4);
            if ~hdata.auto_pause
                btn_generate_Callback(hObject, []); %start metronome
            end
        end
    end


%-------------------------------------------------------------------------------
%% Automatic Script Functions
%--------------------------------------------------------------------------




    function btn_script_Callback(hObject,evendata)
        [FileName,PathName] = uigetfile('*.csv','Select the experiment script file');
        hdata = guidata(hObject); %retrieve gui data
        ncols = hdata.fields_per_m.*hdata.max_metro; %number of columns in spreadsheet file
        if FileName ~= 0
            fid = fopen([PathName, FileName]); %open file
            txtsc_str = repmat('%f ', 1, ncols); %get all the values as floats
            txtsc_str = [txtsc_str '%s']; %add string for label
            ExS = textscan(fid, txtsc_str, 'delimiter', ',');
             
            %Column order:
            %Mx Active, Mx Tone Freq, Mx ISI, Mx Jitt, Mx Pulse Duration, Mx Offset, Mx Pshift Pos, Mx Pshift Magnitude, Mx Pshift Direction, Mx Period Shift,
            %Mx No. of Beats, Mx Minimum Silence
            % x = metronome number
            
            fclose(fid);
            hdata.ExS = ExS; %save imported data to handles
            hdata.NumTrials = length(ExS{1}); %number of trials
            set(handles.txt_scr_pos, 'String', '1'); %set the pointer to 1.
            hdata.scr_ptr = 1; %set pointer
            set(handles.txt_exp_scr, 'String', FileName); %display filename
            %set fields
            guidata(hObject, hdata); %save handles.
            scr_nxt_trial(hObject, handles); %Call next trial
            set(handles.btn_prev, 'Enable', 'On');
            set(handles.btn_next, 'Enable', 'On'); %enable control buttons
   
        end
    end

%-------------------------------------------------------------------------------
    function btn_clr_script_Callback(hObject,evendata)
        %Reset and clear all values
        hdata = guidata(hObject); %retrieve gui data
        hdata.NumTrials = 0;
        hdata.scr_ptr = 0;
        set(handles.txt_scr_pos, 'String', num2str(hdata.scr_ptr)); %display pointer value.
        set(handles.txt_exp_scr, 'String', ''); %clear filename
        hdata.ExS = []; %clear trials matrix
        guidata(hObject, hdata); %save handles.
        set(handles.btn_prev, 'Enable', 'Off');
        set(handles.btn_next, 'Enable', 'Off'); %disable control buttons
    end

%-------------------------------------------------------------------------------
    function btn_prev_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        if hdata.scr_ptr > 1 %check not at end of file.
            hdata.scr_ptr = hdata.scr_ptr - 1; %increment pointer
            set(handles.txt_scr_pos, 'String', num2str(hdata.scr_ptr)); %display pointer value.
            set(handles.txt_auto_scr_pos, 'String', ['Trial: ', num2str(hdata.scr_ptr)]); %display pointer value.
            guidata(hObject, hdata); %update handles
            scr_nxt_trial(hObject, handles); %get next trial data.
        else
            errordlg('No more previous trials available - you are at the first record in this file');
        end
        
    end

%-------------------------------------------------------------------------------
    function btn_next_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        if hdata.scr_ptr < hdata.NumTrials %check not at end of file.
            hdata.scr_ptr = hdata.scr_ptr + 1; %increment pointer
            set(handles.txt_scr_pos, 'String', num2str(hdata.scr_ptr)); %display pointer value.
            set(handles.txt_auto_scr_pos, 'String', ['Trial: ', num2str(hdata.scr_ptr)]); %display pointer value.
            
            guidata(hObject, hdata); %update handles
            scr_nxt_trial(hObject, handles); %get next trial data.
        else
            if ~(hdata.auto_mode)
                errordlg('No more trials available in this file');
            else
                set(handles.txt_auto_scr_pos, 'String', 'End of Experiment!'); %display .
                wavplay(hdata.wav_exp, hdata.wav_f); %play audio voice.
                hdata.auto_pause = 1; %pause trials so they don't continue infinitely!
                guidata(hObject, hdata);
            end
        end
    end

%-------------------------------------------------------------------------

    function scr_nxt_trial(hObject, handles)
        % fills in the field from the selected trial script.
        hdata = guidata(hObject); %retrieve gui data
        ptr = hdata.scr_ptr; %get pointer val
        S = hdata.ExS; %script values
        fields_per_m = hdata.fields_per_m; %number of fields in auto script
        
        guidata(hObject, hdata);
         
        for m = 1:hdata.max_metro
            base = fields_per_m * (m-1); %start index - 1;
            hd = hdata.metronome{m}; %shorten
            if S{base+1}(ptr) > 0 %restrict Active so rogue values not a problem
                tmp_active = S{base+1}(ptr);
            else
                tmp_active = 0;
            end
            switch m
                case 1
                    hd.active = 1; %Metronome 1 always active
                case 2
                    hd.active = tmp_active; %set metronome 2 active
                otherwise
                    if hdata.metronome{m-1}.active == 1
                        hd.active = tmp_active; %as long previous metronome is active we can set this one
                    else
                        hd.active = 0; %otherwise it is inactive also
                    end
            end
            %assign values to memory
            hd.toneFreq = S{base+2}(ptr);
            hd.isi = S{base+3}(ptr);
            hd.isi_sd = S{base+4}(ptr);
            hd.toneDur = S{base+5}(ptr);
            hd.offset = S{base+6}(ptr);
            hd.phasePos = S{base+7}(ptr);
            hd.phaseSize = S{base+8}(ptr);
            hd.phaseNeg = S{base+9}(ptr);
            hd.phasePeriod = S{base+10}(ptr);
            hd.numBeeps = S{base+11}(ptr);
            hd.secsSilence = S{base+12}(ptr);
            
            hdata.metronome{m} = hd;
            hdata.shifts{m} = []; %clear shifts if not in auto script
            guidata(hObject, hdata); %save to gui handles
        end
        hdata.file_cond = S{(fields_per_m * m)+1}(ptr); %get file condition label
         guidata(hObject, hdata); %save to gui handles
         
        update_GUI_Callback(hObject, []);
        
        %insert any phase shifts.
        for m = 1:hdata.max_metro
            hd = hdata.metronome{m};
            if hd.phasePos > 0
                if m==1 %if there's a phase shift insert it
                    btn_insert_shift_Callback(hObject,[]); %Call insert shift function
                else
                    btn_insert_shift_m2_Callback(hObject,[]) ; %call insert shift for metro 2
                end
            else
                hdata.shifts{m} = []; %clear shifts if not in auto script
                guidata(hObject, hdata);
            end
        end
        
        
        
    end




%-------------------------------------------------------------------------------
%% Generate Metronome
%--------------------------------------------------------------------------

    function btn_generate_Callback(hObject,evendata)
        
        %         try
        
        %% Generate Metronome waveform vectors
        Go = 1; %flag to proceed generating metronome in case of issues.
        set(handles.btn_generate, 'ForegroundColor', 'Red');
        set(handles.btn_auto_pause, 'Enable', 'off'); %disable pause button on auto run
        
        update_hdata_Callback(hObject, []); %update hdata to any typed in values on GUI
        
        exp_name = get(handles.list_exp, 'String');
        if isempty(exp_name)
            button = questdlg('No experiment/file has been selected. Data will not be saved. Do you want to continue?','No file','Yes','No','No');
            if strcmp(button, 'Yes')
                Go = 1;
            else
                Go = 0;
            end
        end
        
        if Go %all good to go?
           ms = 1e-3; %millisecs scaler
            %Get the input values from master metronome
            Fs = str2double(get(handles.edt_Fs, 'String'));  %Sample freq.
            Ps = 1/Fs;  %sampling period
            
            for cnt = 1:hdata.max_metro
                hd = hdata.metronome{cnt};
                beep_f(cnt) = hd.toneFreq; %str2double(get(handles.edt_beep_f, 'String'));  %Beep Freq.
                mn_isi(cnt) = hd.isi*ms; %str2double(get(handles.edt_mn_isi, 'String'))*ms;  %Mean isi
                sd_isi(cnt) = (1/sqrt(2))*hd.isi_sd*ms; %str2double(get(handles.edt_sd_isi, 'String'))*ms;  % s.d. isi (/sqrt(2) to make correct)
                beep_len(cnt) = hd.toneDur * ms; %str2double(get(handles.edt_beep_len, 'String'))*ms;  %duration of beep
                num_beeps(cnt) = hd.numBeeps; %str2double(get(handles.edt_num_beeps, 'String')); %number of beeps
                len_silence(cnt) = hd.secsSilence; %str2double(get(handles.edt_silence, 'String')); %length of silence after beeps
                
                beep_cnt(cnt) = round(beep_len(cnt)/Ps); %number of discrete values per beep
                beepx{cnt}=0:beep_cnt(cnt)-1;
                
                rad_isi_fix(cnt) = (sd_isi(cnt) == 0);  %determine fixed or jittered isi
                
            end
            
            % check for bad values:
            bad_val = 0;
            if find(beep_f < 0), bad_val=1; end
            if find(mn_isi < 0), bad_val=1; end
            if find(sd_isi < 0), bad_val=1; end
            if find(beep_len < 0), bad_val=1; end
            if find(num_beeps < 0), bad_val=1; end
            if find(len_silence < 0), bad_val=1; end
            
            if ~bad_val %continue if all ok
                
                waveform = cell(hdata.max_metro,1); %define waveform vector (cell)
                sync_pulse = cell(hdata.max_metro,1); %define sync pulse vector (cell)
                pure_pulse = cell(hdata.max_metro,1); %define non-jittered pulse vector (cell) used for reference in analysis
                
                for m=1:hdata.max_metro
                    if(rad_isi_fix(m)) %fixed isi
                        isi{m} = ones(num_beeps(m), 1).* mn_isi(m);
                        isi_o{m} = ones(num_beeps(m), 1).* mn_isi(m); %original isi without jitter - can be used as reference
                        hdata.isi{m} = isi{m}; %assign to handles.
                        guidata(hObject, hdata); %save to gui handles
                    else %random isi
                        sd_i1 = sd_isi(m)*randn(num_beeps(m),1); %random standard deviations
                        sd_i2 = sd_i1(1:end-1); %offset above to realign next pulse
                        sd_i2 = [0;sd_i2]; %make same length
                        isi{m} = mn_isi(m) + sd_i1 - sd_i2; %add jitter and remove previous to realign.
                        isi_o{m} = ones(num_beeps(m), 1).* mn_isi(m); %original isi without jitter - can be used as reference
                        hdata.isi{m} = isi{m}; %assign to handles.
                        hdata.isi_o{m} = isi_o{m};
                        guidata(hObject, hdata); %save to gui handles
                    end
                    
                    %NO LONGER USED
                    %determine shape of waveform, hard edges or rounded (to stop speaker click).
                    %edge_type = get(handles.pop_wave_shape,'Value');
                    edge_type = 1; %FORCE TO ONE, Other options reserved for future use
                    switch edge_type
                        case 1
                            amp{m} = ones(size(beepx{m})); %stick with harsh beep
                        case 2
                            amp{m} = sin((pi*beepx{m})/beep_cnt(m)); %round off the wave output to a half sine shape.
                        case 3
                            amp{m} = sin((pi*beepx{m})/beep_cnt(m)); %round off the wave output to a half sine shape.
                            amp{m}(1:round(beep_cnt(m)/2)) = 1; %step start rolling off.
                    end
                    
                    %Change audio volume if required...
                    amp{m} = amp{m} .*0.08; %reduce amplitude
                    
                    beepy{m}=(amp{m}.*sin(2*pi*((beep_f(m))/Fs)*beepx{m}))'; %tone generation
                    beepy{hdata.max_metro+1}=(amp{m}.*sin(2*pi*((beep_f(m).*1.5)/Fs)*beepx{m}))'; %higher tone - only used for termination after cont phase
                    
                    hi_pulse{m} = ones(beep_cnt(m), 1); %make the sync pulse
                    
                    isi_gap = cell(hdata.max_metro,1); %initialise vars for phase shifts.
                    isi_o_gap = cell(hdata.max_metro,1);
                    period_sh = 0; %not a period shift yet
                    
                    for iterations_i=1:num_beeps(m)  %Construct the waveform vector...
                        if(~isempty(hdata.shifts{m}))  %Look for any inserted phase shifts.
                            shift_ind = find(hdata.shifts{m}(:,1)==iterations_i);
                        else
                            shift_ind = [];
                        end
                        if ~isempty(shift_ind) || period_sh %is there a phase shift here or is period shift set?
                            if period_sh %working to a period shift?
                                isi_shift_pc = period_pc; %set same magnitude shift for each beat
                                sh_direction = period_dir; %shift direction
                            else %just a phase shift
                                isi_shift_pc = hdata.shifts{m}(shift_ind, 2); %get percentage shift
                                sh_direction = hdata.shifts{m}(shift_ind, 3); %get direction
                            end
                            if ~period_sh && hdata.shifts{m}(shift_ind, 4)
                                period_sh = 1;
                                period_pc = isi_shift_pc; %set period shift to current phase shift magnitude
                                period_dir = hdata.shifts{m}(shift_ind, 3); %set direction
                            end
                            if  sh_direction == 1; %use negative shift
                                isi_gap{m} = zeros(round((isi{m}(iterations_i)-beep_len(m)-(isi{m}(iterations_i).*(isi_shift_pc/100)))/Ps), 1); %create isi gap with neg shift
                                isi_o_gap{m} = zeros(round((isi_o{m}(iterations_i)-beep_len(m)-(isi_o{m}(iterations_i).*(isi_shift_pc/100)))/Ps), 1); %create isi gap with neg shift
                            else
                                isi_gap{m} = zeros(round((isi{m}(iterations_i)-beep_len(m)+(isi{m}(iterations_i).*(isi_shift_pc/100)))/Ps), 1); %create isi gap with pos shift
                                isi_o_gap{m} = zeros(round((isi_o{m}(iterations_i)-beep_len(m)+(isi_o{m}(iterations_i).*(isi_shift_pc/100)))/Ps), 1); %create isi gap with pos shift
                            end
                        else
                            isi_gap{m} = zeros(round((isi{m}(iterations_i)-beep_len(m))/Ps), 1); %create isi gap with no shift
                            isi_o_gap{m} = zeros(round((isi_o{m}(iterations_i)-beep_len(m))/Ps), 1); %create non-jitter isi gap with no shift
                        end
                        waveform{m} = [waveform{m}; beepy{m}; isi_gap{m}];
                        sync_pulse{m} = [sync_pulse{m}; hi_pulse{m}; isi_gap{m}];
                        pure_pulse{m} = [pure_pulse{m}; hi_pulse{m}; isi_o_gap{m}]; %generate the non-jittered ref vector.
                    end
                    waveform{m} = [0;waveform{m}];      %add a single baseline zero to a zero-one transition at start
                    sync_pulse{m} = [0;sync_pulse{m}];
                    pure_pulse{m} = [0;pure_pulse{m}];
                    pulse_lengths(m) = length(sync_pulse{m}); %get lengths to see if they match
                end
                
                hd = hdata.metronome;
                all_en_flags = [hd{1}.active, hd{2}.active]; %which metronomes are active
                max_en = find(all_en_flags~=0, 1, 'last'); %find last metronome enabled
                
                pulse_lengths = pulse_lengths(1:max_en); %discard unused!
                if ~all(pulse_lengths == pulse_lengths(1)); %different length vectors
                    [dummy, largest_pulse] = max(pulse_lengths);
                    for m =1:max_en
                        if m~= largest_pulse
                            ext_length(m) = pulse_lengths(largest_pulse) - pulse_lengths(m);
                            len_silence(m) = len_silence(m) + ext_length(m)/Fs; %add extra silence to fill the gap
                        else
                            ext_length(m) = 0;
                        end
                    end
                end
                
                
                %add 'silence' to waveform - sync pulses will continue.
                for m=1:hdata.max_metro
                    if len_silence(m) > 0
                        silence_wav = [zeros(round(len_silence(m)/Ps), 1)];  %blank period to insert to end of waveform plus end tone.
                        pulse_silence = cell(hdata.max_metro,1); %empty cell to store continuation phase pulses.
                        
                        num_pulses(m) = ceil(len_silence(m)/mn_isi(m));  %calc num sync pulses required.
                        isi_silence{m} = zeros(round((mn_isi(m)-beep_len(m))/Ps), 1);
                        for i=1:num_pulses(m)
                            pulse_silence{m} = [pulse_silence{m}; ones(beep_cnt(m), 1); isi_silence{m}];
                        end
                        if length(pulse_silence{m}) > length(silence_wav)   %ensure equal length
                            pulse_silence{m} = pulse_silence{m}(1:length(silence_wav));
                        elseif length(pulse_silence{m}) < length(silence_wav)
                            diff = length(silence_wav) - length(pulse_silence{m});
                            pad = zeros(diff,1);
                            pulse_silence{m} = [pulse_silence{m}; pad];
                        end
                        waveform{m} = [waveform{m}; silence_wav];
                        sync_pulse{m} = [sync_pulse{m}; pulse_silence{m}];
                        pure_pulse{m} = [pure_pulse{m}; pulse_silence{m}];
                    end
                    
                    m_offs = hdata.metronome{m}.offset*ms; %str2double(get(handles.edt_m2_offset, 'String'))*ms; %get the offset of m2 to m1
                    
                    
                    if(m_offs ~= 0)
                        waveform{m} = [zeros(round(mn_isi(m)/Ps)+round(m_offs/Ps), 1); waveform{m}]; %append initial gap to m2 with offset.
                        sync_pulse{m} = [zeros(round(mn_isi(m)/Ps)+round(m_offs/Ps), 1); sync_pulse{m}]; %append initial gap to m2 with offset.
                        pure_pulse{m} = [zeros(round(mn_isi(m)/Ps)+round(m_offs/Ps), 1); pure_pulse{m}]; %non-jittered reference
                    else
                        waveform{m} = [zeros(round(mn_isi(m)/Ps), 1); waveform{m}]; %append an initial isi gap with no shift
                        sync_pulse{m} = [zeros(round(mn_isi(m)/Ps), 1); sync_pulse{m}]; %create an initial isi gap with no shift
                        pure_pulse{m} = [zeros(round(mn_isi(m)/Ps), 1); pure_pulse{m}]; %non-jittered reference
                    end
                end
                
                
                
                valid_lengths =[];
                for m=1:max_en
                    valid_lengths = [valid_lengths, length(sync_pulse{m})]; %append length of each vector
                end
                
                [max_l, max_m] = max(valid_lengths); %find max vector size
                
                for m=1:max_en
                    diffw = max_l - length(sync_pulse{m});
                    waveform{m} = [waveform{m}; zeros(diffw, 1); beepy{hdata.max_metro+1}; beepy{hdata.max_metro+1}]; %add extra zeros to the end.
                    sync_pulse{m} = [sync_pulse{m}; zeros(diffw, 1); zeros(2*length(beepy{hdata.max_metro+1}),1)]; %append extra zeros to pad out (future option to append to front?)
                    pure_pulse{m} = [pure_pulse{m}; zeros(diffw, 1); zeros(2*length(beepy{hdata.max_metro+1}),1)];
                end
                
                % Not used, created from sync pulses in daq inout...
                %            gating_pulse = ones(length(pure_pulse{1}), 1); %make gating pulse for single channel input devices.
                %            gating_pulse([1:2, end-1:end]) = 0; %add zeros so we can detect low to high transition
                %
                
                %clear unused metronomes - keep structure
                %             for m=max_en+1:hdata.max_metro
                %                 waveform{m} = zeros(max_l,1);
                %                 sync_pulse{m} = zeros(max_l,1);
                %                 pure_pulse{m} = zeros(max_l,1);
                %             end
                
                
                %clear unused metronomes - remove whole structure
                m = max_en;
                waveform(m+1:end) = [];
                sync_pulse(m+1:end) = [];
                pure_pulse(m+1:end) = [];
                
                
                hdata.max_en = max_en; %store number of metronomes enabled.
                guidata(hObject, hdata);
                
                
                
                
                %combine metronome signals
                sum_wav = waveform{1};
                for m=2:max_en
                    sum_wav = sum_wav +waveform{m}; %combine waveforms
                end
                
                %         catch
                %             errordlg('Error creating metronome signal. Check parameters are valid', 'Error');
                %         end
                
                %         try
                %sound(sum_wav, Fs); %Uncomment to send to sound card.
                
                % send data to DAQ
                %Number of metronomes determines signals sent to DAQ
                switch max_en
                    case{1}
                        data_out = [sync_pulse{1}, waveform{1}, zeros(size(waveform{1},1),2)]; %just audio and sync pulse
                    case {2}
                        if hdata.metronome{2}.active == 1 %output to single channel
                            data_out = [sync_pulse{1}, sum_wav, sync_pulse{2}, zeros(size(waveform{1},1),1)]; %audio channels combined plus sync pulses
                        else %output to 2 channels
                            data_out = [sync_pulse{1}, waveform{1}, sync_pulse{2}, waveform{2}]; %sync pulse 1, audio,  then sync 2, audio
                        end
                end
                
%                 try
                 [inputdata, int_hw, return_struct] = DAQ_inout_v5_20(data_out, Fs); %Call DAQ function which returns input data
                % note changes to data format for single metronome above should you resurrect any older versions than 5_15
%                 catch
%                     errordlg('Error in generating metronome')
%                 end
                % int_hw legend
                % NIDAQ = 0
                % internal hardware with keyboard = 1
                % internal hardware with loopback to mic = 2
                
                if int_hw==1
                    set(handles.txt_daq_stat, 'ForegroundColor', 'Red');
                    set(handles.txt_daq_stat, 'String', 'Warning: using internal H/W'); %warn users DAQ not been used
                    set(handles.txt_daq_stat_auto, 'ForegroundColor', 'Red');
                    set(handles.txt_daq_stat_auto, 'String', 'Warning: using internal H/W'); %warn users DAQ not been used
                else
                    set(handles.txt_daq_stat, 'String',''); %warn users DAQ not been used
                    set(handles.txt_daq_stat_auto, 'String',''); %warn users DAQ not been used
                end
                
                hdata.capt_data = inputdata; %captured daq data to pass to db.
                hdata.sync_pulse = sync_pulse; %store metronome sync_pulse data
                hdata.pure_pulse = pure_pulse; %store non-jittered reference
                guidata(hObject, hdata); %save to gui handles
                
                exp_ind = get(handles.list_exp, 'Value');
                
                if ~isempty(exp_name) %check we have a list of experiments
                    exp_name = exp_name{exp_ind};  %get the subject name
                    
                    
                    
                    if ~strcmp(exp_name, '<No Experiments>') && ~isempty(exp_name) %inidicates exp list is empty
                        new_tr_num = hdata.num_trials + 1; %increment trial counter.
                        if ~(hdata.auto_mode)
                            if strcmp(hdata.file_cond{1}, '')
                                %%%Prompt to save trial
                                line1 = ['Do you want to save this capture?\n\nExperiment: ', exp_name, '  Trial No.: ', num2str(new_tr_num)];
                                line2 = '\n\nEnter optional trial condition label below                                              ';
                                qd_str = sprintf([line1 line2]);
                                saveanswer = inputdlg(qd_str,'Enter condition and save trial'); %Input dialog to allow condition to be entered
                            else
                                
                                %                             simple version of save dialog
                                qd_str = {'Do you want to save this capture?               ','','', ['Experiment: ', exp_name],'', ['Trial No.: ', num2str(new_tr_num)],''};
                                dlg_save = questdlg(qd_str, 'Save Capture?','Yes','No','Yes'); %Prompt to save file
                                if strcmp(dlg_save, 'Yes')
                                    saveanswer = hdata.file_cond; %just drag back file_cond
                                else
                                    saveanswer = []; %empty
                                end
                            end
                            if ~isempty(saveanswer)
                                hdata.file_cond = saveanswer; %store string condition
                                guidata(hObject, hdata); %store
                                btn_grab_Callback(hObject, [], handles); %call grab capture routine direct.
                            else
                                hdata.file_cond = {''};
                                hdata.shifts = cell(hdata.max_metro,1); %clear phase shifts
                                hdata.file_cond = {''}; %clear the label
                                guidata(hObject, hdata); %store
                                
                            end
                        else
%                             hdata.file_cond = {''};
                             guidata(hObject, hdata); %store
                            btn_grab_Callback(hObject, [], handles); %Save automatically
                            btn_next_Callback(hObject, []); %proceed to next trial
                            pause(1);
                            % wavplay(hdata.wav_trial, hdata.wav_f); %play audio voice
                            
                        end
                        
                    else
                        %warn that no file has been selected.
                        warndlg('No experiment file has been selected to save this capture to. You should set up an experiment file before continuing further.', 'No Experiment!!', 'OK');
                        hdata.shifts = cell(hdata.max_metro,1); %clear phase shifts
                        guidata(hObject, hdata); %store
                    end
                    
                    set(handles.btn_auto_pause, 'Enable', 'on'); %re-enable button
                    pause(1); %pause for 2 seconds
                    if ~hdata.auto_pause
                        wavplay(hdata.wav_cntdn, hdata.wav_f, 'async'); %play audio voice
                    end
                    pause(3);
                    if hdata.auto_mode && ~hdata.auto_pause
                        btn_generate_Callback(hObject, []); %call next trial immediately
                    end
                    
                    %         catch
                    %             errordlg('Error outputting metronome. Check DAQ connections and settings', 'Error');
                    %         end
                end
            else
                errordlg('Negative or invalid numbers found in settings. Please check and correct');
            end
        end
        
    end

%-------------------------------------------------------------------------------
%% File Manager Functions
%--------------------------------------------------------------------------


    function list_trial_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        selected = get(handles.list_trial, 'Value');
        sel_str = get(handles.list_trial, 'String');
        if ischar(sel_str)
            sel_str = cellstr(sel_str);
        end
        sel_str = sel_str{selected};
        
        if selected > 0 && ~strcmp(sel_str, '<Empty>') && ~isempty(sel_str)
            exp_ind = get(handles.list_exp, 'Value');
            exp_name = get(handles.list_exp, 'String'); %get experiment list
            exp_name = exp_name{exp_ind};  %get the subject/experiment name
            trials = get(hObject,'String'); %get trial list.
            tr_sel = trials{get(hObject, 'Value')}; %get selected trial
            trial_name = [exp_name hdata.rd_prefix num2str(tr_sel) '.mat']; %generate filename.
            load([hdata.subject_dir trial_name], 'raw_data');
            axes(handles.axes1);
            if ~isempty(raw_data)
                plot(raw_data);
            end
        end
    end

%-------------------------------------------------------------------------------
    function list_trial_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------

    function btn_refresh_list_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        if exist(hdata.work_dir)
            refresh_exp(handles)
            refresh_trial(handles, hObject)
        end
    end

%-------------------------------------------------------------------------------

    function btn_new_exp_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        exp_name = get(handles.edt_new_exp, 'String');
        if (~isempty(exp_name))
            dirname = [hdata.dir_prefix exp_name];
            chk_dir = dirdir(hdata.work_dir);  %get contents of this path.
            valid_dir = strcmp(chk_dir, dirname); %find if any directories already exist with this name.
            if(~valid_dir)
                try
                    mkdir(hdata.work_dir, dirname);  %create new directory if unique
                    hdata.subject_dir = [hdata.work_dir '/' dirname];  %create a subject active dir.
                    guidata(hObject, hdata); %update handles.
                    mkdir(hdata.subject_dir, 'raw_data');  %create raw data directory
                    mkdir(hdata.subject_dir, 'events'); %create onsets directory
                    mkdir(hdata.subject_dir, 'analysis'); %create analysis directory.
                catch
                    errordlg('Failed to create directory, check name only uses valid characters and that the disk is not write protected');
                end
            else
                errordlg('This ID already exists, you must enter a unique ID.');
            end
        end
        
        set(handles.edt_new_exp, 'String', ''); %clear string box
        refresh_exp(handles);
    end

%-------------------------------------------------------------------------------
    function btn_set_path_Callback(hObject,evendata)
        hdata = guidata(hObject); %retrieve gui data
        if exist(hdata.work_dir)
            st_dir = hdata.work_dir; %set starting directory
        else
            st_dir = ''; %defaults to PWD
        end
        dir_name = uigetdir(st_dir,'Select the appropriate directory to store file structure.'); %Let user select working directory.
        if dir_name ~= 0
            hdata.work_dir = dir_name;  %set new path.
            guidata(hObject, hdata); % Update handles structure
            refresh_exp(handles);
            set(handles.edt_work_path, 'String', hdata.work_dir);
        end
    end

%-------------------------------------------------------------------------


    function refresh_trial(handles, hObject)  %update the trial list
        hdata = guidata(hObject); %retrieve gui data
        chosen_ind = get(handles.list_exp, 'Value'); %Get the value clicked.
        chosen_name = get(handles.list_exp, 'String'); %whole list
        stripped{1}=[];
        list_str = [];
        
        if (chosen_ind > 0 & ~isempty(chosen_name))
            %%the following line will crash if there is no name for the trial.. Hello!
            chosen_name = chosen_name{chosen_ind}; %get the chosen item only
            rd_prefix = hdata.rd_prefix;  %raw data prefix
            exp = [hdata.dir_prefix chosen_name]; %Get the chosen exp name and add prefix.
            hdata.subject_dir = [hdata.work_dir '/' exp '/raw_data/'];  %set the subject active dir.
            guidata(hObject, hdata); %update handles.
            tr_struct = dir([hdata.subject_dir '*' rd_prefix 'trial*.mat']); %get list of trial files
            [trial_list,trial_index] = sortrows({tr_struct.name}'); %sort the file names into order
            hdata.trial_list = trial_list;
            hdata.num_trials = length(trial_list); %number of trial files.
            guidata(hObject,hdata); %save to gui handles.
            
            k = strfind(trial_list, [hdata.rd_prefix 'trial_']);  %find the trial string within the file name
            for i=1:length(trial_list)
                stripped{i} = trial_list{i}(k{i}(1)+length(hdata.rd_prefix):end-4);   %remove everything every trial_n. 4 = .mat
            end
            if ~isempty(stripped{1})
                set(handles.list_trial, 'String', stripped);
                %if get(handles.list_trial, 'Value') > length(stripped)
                set(handles.list_trial, 'Value', 1); %reset selected to first to stop bug
                %end
            else
                stripped{1} = '<Empty>';
                set(handles.list_trial, 'String', stripped);
                set(handles.list_trial, 'Value', 1); %reset selected to first to stop bug
            end
        end
    end

% -----------------------------------------------------

    function refresh_exp(handles)  %refresh the experiment list box
        
        hdata = guidata(handles.figure1); %retrieve gui data
        
        dir_struct = dirdir(hdata.work_dir); %dirdir is matlab central function - just lists directories
        [sorted_names,sorted_index] = sortrows({dir_struct.name}');
        valid_dir = strncmp(sorted_names, hdata.dir_prefix, length(hdata.dir_prefix)); %find directories with prefix attached.
        hdata.file_names = sorted_names(valid_dir==true); %%store only directories with prefix attached.
        
        for i=1:length(hdata.file_names)
            hdata.file_names{i} = hdata.file_names{i}(length(hdata.dir_prefix)+1:end); %remove the prefix.
        end
        
        hdata.sorted_index = sorted_index(valid_dir==true);
        guidata(handles.figure1,hdata)
        set(handles.list_exp,'String',hdata.file_names,'Value',1)
        
    end

%---------------------------------------------------------------

    function btn_grab_Callback(hObject, eventdata, handles)
        hdata = guidata(handles.figure1); %retrieve gui data
        exp_ind = get(handles.list_exp, 'Value');
        max_en = hdata.max_en; %number of metronomes enabled
        max_metro = hdata.max_metro; %max number of metroome
        file_cond_exist = sum(cellfun(@(x) strcmp(x, 'file_cond'), fieldnames(hdata)));
        if file_cond_exist
            file_cond = hdata.file_cond; %experiment condition label
        else
            file_cond = {''};
        end
        sync_pulses = hdata.sync_pulse; %get sync pulse data 
        pure_pulses = hdata.pure_pulse; %get non_jittered version of pulses
        raw_data = hdata.capt_data; %get captured data.
        
        Fs = str2double(get(handles.edt_Fs, 'String')); %input sampling frequency
        stimulus = hdata.metronome; %get metronome stats;
        for m = max_en+1:max_metro
            stimulus{m} = []; %delete data from unused metronomes
        end;
             
        refresh_trial(handles, hObject);
        exp_name = get(handles.list_exp, 'String');
        exp_name = exp_name{exp_ind};  %get the subject name
        new_tr_num = hdata.num_trials + 1; %increment trial counter.
        hdata.num_trials = new_tr_num;  %store latest trial num
        hdata.shifts = cell(hdata.max_metro,1); %clear phase shifts.
        hdata.file_cond = {''}; %clear file cond. 
        guidata(hObject, hdata); %update handles.
        trial_name = [exp_name hdata.rd_prefix 'trial_' num2str(new_tr_num) '.mat']; %generate filename.
        save([hdata.subject_dir trial_name], 'stimulus', 'raw_data', 'sync_pulses', 'pure_pulses', 'Fs', 'max_en', 'file_cond');
        
        %create struct for live analysis
        raw.Fs = Fs;
        raw.max_en = max_en;
        raw.pure_pulses = pure_pulses;
        raw.raw_data = raw_data;
        raw.stimulus = stimulus;
        raw.sync_pulses = sync_pulses;
        raw.file_cond = file_cond;
        
        
        
		fname_conds = [hdata.subject_dir exp_name '_conditions_list.csv']; %csv file containing list of condition labels
        try
            fid=fopen(fname_conds,'a');
            if isempty(file_cond{1})
                file_cond{1} = ' '; %make it a space instead of empty string so it doesn't mess up the strtok reading. 
            end
            cond_entry = {num2str(new_tr_num), char(file_cond), datestr(now, 'dd/mm/yyyy HH:MM:SS')}; %trial, cond, time
            fprintf(fid,'%s,',cond_entry{1:end-1});
            fprintf(fid,'%s\n',cond_entry{end});
            
            fclose(fid);
        catch
            errordlg('Failed to save condition label to Conditions List file');
        end
		
		set(handles.btn_generate, 'ForegroundColor', 'Black');
        refresh_trial(handles, hObject);
        
        %call live analysis
        try
         [stimulus, all_onsets, daq_delay] = mattap_eventdetect_v6_00(raw, [0 0], 0); %call event detect for current trial
         [res, xl] = mattap_analyse_v6_00(stimulus, all_onsets, max_en); %call analysis
         call_analysis_once(hObject, [], handles, res);
        catch
        end
    end

    function call_analysis_once(hObject, eventdata, handles, res)
        
        try
            mn_asy = sprintf('%8.2f', res.mn_asy{1}(5,1));
            sd_asy = sprintf('%8.2f',  res.sd_asy{1}(5,1));
            %sd_asy = num2str(sd_asy(1,:));
            
            %mn_iri = num2str(sp.mn_IRI(1,4));
            mn_iri = sprintf('%8.2f', res.mn_iri(1,1,1));
            %mn_isi = num2str(sp.mn_IRI(1,1:3));
            mn_isi = sprintf('%8.2f', res.mn_isi(1,1));
            %sd_iri = num2str(sp.sd_IRI(1,4));
            sd_iri = sprintf('%8.2f', res.sd_iri(1,1,1));
            
            %sd_isi = num2str(sp.sd_IRI(1,1:3));
            sd_isi = sprintf('%8.2f', res.sd_isi(1,1));
            
            
            live_str = {['Mean Async: ' mn_asy '    Mean IRI:   ' mn_iri '    Mean ISI:   ' mn_isi];...
                [];...
                ['SD Async:   ' sd_asy '    SD IRI:     ' sd_iri '    SD ISI:     ' sd_isi]};
        catch
            live_str = '<ERROR in Live Analysis>';
        end
        set(handles.txt_live_analysis, 'String', live_str); %output to GUI
    end




%-------------------------------------------------------------------------------
%% Analysis Functions
%-------------------------------------------------------------------------


    function btn_eventdet_Callback(hObject,evendata)
        % RUNS ONSET ANALYSIS ETC
        hdata = guidata(hObject); %retrieve gui data
        refresh_trial(handles, hObject);
        event_type = hdata.eventtype; %onset, peak, trough detection
        visual_on = hdata.visual_on; %visual check enable
        inc_xl = hdata.inc_xl; % output to excel
        
        try
            [ok, evpath, evfiles] = mattap_eventdet_wrapper_v6_00(event_type, visual_on); %Call handler for event detection
        catch
            errordlg('Error occurred in Event Detection');
            ok=0;
        end
        if ok==1
            cd(evpath);
            cd('..'); %return to top level;
            do_an = questdlg('Run analysis on the same files?','Start analysis?','Yes', 'No', 'Yes');
            if strcmp(do_an, 'Yes')
                [oka, savepath, analysis_file] = mattap_analyse_wrapper_v6_00(inc_xl, evfiles, evpath); %call analyse direct
                if oka == 1
                    msgbox('Analysis completed successfully', 'Analysis complete');
                else
                    msgbox('An error occurred during analysis', 'Analysis error', 'error');
                end
            end
            
        end
    end

    function btn_analyse_Callback(hObject,evendata)
        % RUNS ONSET ANALYSIS ETC
        hdata = guidata(hObject); %retrieve gui data
        refresh_trial(handles, hObject);
        inc_xl = hdata.inc_xl; % output to excel
        
        
        [oka, savepath, analysis_file] = mattap_analyse_wrapper_v6_00(inc_xl); %call analyse direct
        
        
        if oka == 1
            cd(savepath);
            cd('..'); %return to top level;
            msgbox('Analysis completed successfully', 'Analysis complete');
        elseif oka == 0
            msgbox('An error occurred during analysis', 'Analysis error', 'error');
        end
        
    end



%             sp = struct('trial_id', [], 'm_enabled',[], 'mn_IRI', [], 'sd_IRI', [], 'mn_async', [], 'sd_async', [],  'stimulus_f', ...
%                 [], 'set_jitt', [], 'set_offs', [], 'm1m2_diff', []); %sync phase summary
%             cp = sp; %cont phase summary.
%             sp.sd_async = cell(4, 1); %convert to cell
%             sp.mn_async = sp.sd_async;
%             cp.sd_async = cell(4, 1); %convert to cell
%             cp.mn_async = cp.sd_async;
%
%
%             for i = 1:hdata.num_trials
%                 trial_ptr_lst = get(handles.list_trial, 'String'); %Get trial num from list - so numbers don't need to be sequential
%                 trial_ptr = trial_ptr_lst{i};
%                 disp(trial_ptr);
%                 trial_name = [exp_name hdata.rd_prefix trial_ptr '.mat']; %generate filename.
%
%                 if exist([hdata.subject_dir trial_name], 'file')
%                     clear raw_data stimulus sync_pulses aligned_onsets asyncs %clear old vars.
%                     disp(i);
%                     try
%                         [sp, cp] = mattap_analyse_v4_51(hdata, exp_name, trial_ptr, sp, cp, 0); %call analysis function
%                     catch
%                         disp(['**SKIPPED: ' trial_ptr '. Analysis failed on this trial']);
%
%                         %rethrow(lasterror)
%                     end
%                 end
%             end
%             sum_tbl_fname = [exp_name '_SUMMARY_TABLE.mat'];
%             save([hdata.onsets_dir sum_tbl_fname], 'sp', 'cp','-v6');
%         end
%     end

%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%% Tab Control
%-------------------------------------------------------------------------

    function btn_file_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hdata.auto_mode = 0; %turn off auto mode
        guidata(hObject, hdata);
        set(handles.btn_metro, 'Enable', 'On'); %Enable metronome button.
        set(handles.btn_file, 'Enable', 'Off'); %Disable file button
        set(handles.btn_auto, 'Enable', 'On'); %Disable auto button
        set(handles.pnl_auto, 'Visible', 'Off'); % auto panel
        set(handles.pnl_metro, 'Visible', 'Off'); %hide metronome panel
        set(handles.pnl_file, 'Visible', 'On'); %show file panel
        
        an_options_Callback(hObject,evendata); %update analysis settings
    end

%-------------------------------------------------------------------------------
    function btn_metro_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hdata.auto_mode = 0; %turn off auto mode
        guidata(hObject, hdata);
        set(handles.btn_metro, 'Enable', 'Off'); %Enable metronome button.
        set(handles.btn_file, 'Enable', 'On'); %Disable file button
        set(handles.btn_auto, 'Enable', 'On'); %Disable auto button
        set(handles.pnl_auto, 'Visible', 'Off'); % auto panel
        set(handles.pnl_metro, 'Visible', 'On'); %hide metronome panel
        set(handles.pnl_file, 'Visible', 'Off'); %show file panel
    end
%-------------------------------------------------------------------
    function btn_auto_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hdata.auto_mode = 1; %turn ON auto mode
        guidata(hObject, hdata);
        set(handles.btn_metro, 'Enable', 'On'); %Enable metronome button.
        set(handles.btn_file, 'Enable', 'On'); %Enable file button
        set(handles.btn_auto, 'Enable', 'Off'); %Disable auto button
        set(handles.pnl_auto, 'Visible', 'On'); % auto panel
        set(handles.pnl_metro, 'Visible', 'Off'); %metronome panel
        set(handles.pnl_file, 'Visible', 'Off'); %file panel
        
        %Set trial text
        if isfield(hdata, 'scr_ptr')
            set(handles.txt_auto_scr_pos, 'String', ['Trial: ', num2str(hdata.scr_ptr)]); %set the trial display.
        else
            set(handles.txt_auto_scr_pos, 'String', 'No Trials!'); %No script loaded.
        end
        
    end
%-------------------------------------------------------------------------
%% Phase Shift + Misc Functions
%------------------------------------------------------------------------


    function btn_insert_shift_Callback(hObject,evendata)
        update_hdata_Callback(hObject, []); %update hdata to GUI Settings
        hdata = guidata(hObject);
        hd = hdata.metronome{1};
        max_beep = hd.numBeeps; %max pos
        shift_pos = hd.phasePos; %Phase shift position
        shift_pc = hd.phaseSize; %size of phase shift. 
        neg = hd.phaseNeg; %1 for negative shift else 0
        period_sh = hd.phasePeriod; %one for period shift. 
        
%         shift_pos = str2double(get(handles.edt_shift_pos, 'String'));  %chosen pos
%         shift_pc = str2double(get(handles.edt_shift_size, 'String'));  %size of shift (%isi)
%         
        
        
        if(shift_pos <= max_beep && shift_pos > 1 && shift_pc <= 1000 && shift_pc > 0)
            
%             %create a shifts matrix storing the inserted phase shifts.
%             if (get(handles.tck_neg_shift, 'Value')) %neg shift is chosen
%                 neg = 1;
%             else
%                 neg = 0;
%             end


            
%             period_sh = get(handles.tck_per_shift, 'Value'); %enable period shift
            
            new_shift = [shift_pos, shift_pc, neg, period_sh];
            shifts = [hdata.shifts{1}; new_shift];
            
            set(handles.txt_live_analysis, 'String', {'Inserted shift: ' num2str(shifts(end,:)) 'to Metronome 1'}); %output to GUI
            [b,m,n] = unique(shifts(:, 1)'); %remove duplicate inserts.
            m =m';
            shifts = shifts(m,:);
            hdata.shifts{1} = shifts; %assign to handles.
           
            guidata(hObject, hdata); %save to gui handles
        else
            errordlg('Invalid values in phase shift data. Check the entered values are within range.')
        end
    end

%-------------------------------------------------------------------------------
    function btn_insert_shift_m2_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hd = hdata.metronome{2};
        max_beep = hd.numBeeps; %max pos
        shift_pos = str2double(get(handles.edt_shift_pos_m2, 'String'));  %chosen pos
        shift_pc = str2double(get(handles.edt_shift_size_m2, 'String'));  %size of shift (%isi)
        
        
        if(shift_pos <= max_beep && shift_pos > 1 && shift_pc <= 1000 && shift_pc > 0)
            
            %create a shifts matrix storing the inserted phase shifts.
            if (get(handles.tck_neg_shift_m2, 'Value')) %neg shift is chosen
                neg = 1;
            else
                neg = 0;
            end
            
            period_sh = get(handles.tck_per_shift_m2, 'Value'); %enable period shift
            
            new_shift = [shift_pos, shift_pc, neg, period_sh];
            shifts = [hdata.shifts{2}; new_shift];
            
            set(handles.txt_live_analysis, 'String', {'Inserted shift: ' num2str(shifts(end,:)) 'to Metronome 2'}); %output to GUI
            
            
            [b,m,n] = unique(shifts(:, 1)'); %remove duplicate inserts.
            m =m';
            shifts = shifts(m,:);
            hdata.shifts{2} = shifts; %assign to handles.
            guidata(hObject, hdata); %save to gui handles
        else
            errordlg('Invalid values in phase shift data. Check the entered values are within range.')
        end
    end

%--------------------------------------------------------------------------


    function tck_enable_m1_Callback(hObject,evendata)
        %Enable / Disable Metronome M1 (show - hide panel)
        if (get(handles.tck_enable_m1, 'Value')==1); %M2 Enabled status
            set(handles.pnl_m1, 'Visible', 'on'); %show if enabled
        else
            set(handles.pnl_m1, 'Visible', 'off'); %hide
        end
    end

%-------------------------------------------------------------------------------
    function tck_enable_m2_Callback(hObject,evendata)
        %Enable / Disable Metronome Mn (show - hide panel)
        metro_sel = 2;
        is_active = hdata.metronome{metro_sel}.active; %get current state
        is_active_pre = hdata.metronome{metro_sel-1}.active; %get state of prior metron - must be enabled. 
        metro_mode = get(handles.pop_metro_select, 'Value');
        update_hdata_Callback(hObject, []); %grab any updates first
        
%         switch metro_sel
%             case 2
                edt_sel = handles.edt_num_beeps2; %select edit box to enable
%             case 3
%                 edt_sel = handles.edt_num_beeps3;
%             case 4
%                 edt_sel = handles.edt_num_beeps4;
%         end
        
        if (get(handles.tck_enable_m2, 'Value')==1); %Mn Enabled status
            if is_active_pre > 0
                set(handles.pnl_m2, 'Visible', 'on'); %show if enabled
                set(edt_sel, 'Enable', 'on'); %show num beeps
                hdata.metronome{metro_sel}.active = metro_mode; %enable the metronome
                guidata(hObject, hdata);
                update_GUI_Callback(hObject, []); %update panel data
            else
                set(handles.pnl_m2, 'Visible', 'off'); %metronome can't be enbled
                set(edt_sel, 'Enable', 'off'); %disable num beeps
                hdata.metronome{metro_sel}.active = 0; %disable the metronome
                set(handles.tck_enable_m2, 'Value', 0); %don't allow box to be ticked
                errordlg(['Metronome ' num2str(metro_sel-1) ' needs to be activated before activating this one.']);
            end
        else
            set(handles.pnl_m2, 'Visible', 'off'); %metronome not be enbled
            update_hdata_Callback(hObject, []); %grab any edits and update hdata first
            for cnt = metro_sel:hdata.max_metro
                hdata.metronome{cnt}.active = 0; %disable the metronome and any subsequent metronomes
%                 switch cnt
%                     case 2
                        edt_sel = handles.edt_num_beeps2; %select edit box to disable
%                     case 3
%                         edt_sel = handles.edt_num_beeps3;
%                     case 4
%                         edt_sel = handles.edt_num_beeps4;
%                 end
                set(edt_sel, 'Enable', 'off'); %disable num beeps
            end
            
        end
        guidata(hObject, hdata); %save to gui handles
    end
%-------------------------------------------------------------------------------

    function tck_inc_xl_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hdata.inc_xl = get(handles.tck_inc_xl, 'Value');
        guidata(hObject, hdata);
    end


%-----------------------------------------------------------------------

%%  Update GUI functions

%function update GUi values
    function update_GUI_Callback(hObject, evendata)
        hdata = guidata(hObject);
        hd = hdata.metronome{1}; %shorten
        %M1 SETTINGS
        set(handles.tck_enable_m1, 'Value', 1); %Always Enable M1
        tck_enable_m1_Callback(hObject, []); %Tick enable callback - sets visibility of M1
        
        set(handles.edt_mn_isi, 'String', num2str(hd.isi)); %ISI 1
        set(handles.edt_beep_len, 'String', num2str(hd.toneDur)); %Tone duration.
        set(handles.edt_beep_f, 'String', num2str(hd.toneFreq)); %Tone frequency
        set(handles.edt_shift_pos, 'String', num2str(hd.phasePos)); %phase shift position
        set(handles.edt_shift_size, 'String', num2str(hd.phaseSize)); %phase shift magnitude
        set(handles.tck_neg_shift, 'Value', hd.phaseNeg); %phase shift direction
        set(handles.tck_per_shift, 'Value', hd.phasePeriod); %period shift set
        
        %Jitter setting
        set(handles.edt_sd_isi, 'String', num2str(hd.isi_sd)); %set isi jitter
        set(handles.edt_num_beeps1, 'String', num2str(hd.numBeeps)); %numb r metronome beatse 
        set(handles.edt_silence, 'String', num2str(hd.secsSilence)); %number of seconds silence
        
        
        
% Second Metronome
        
        hd = hdata.metronome{2}; %get visible metronome
        
        
        
        %M2 SETTINGS
        if hd.active ~= 0 %is M2 enabled? Determine by M2 ISI = 0
            set(handles.pnl_m2, 'Visible', 'on'); %show if enabled
            set(handles.tck_enable_m2, 'Value', 1); %Enable M2
            set(handles.pop_metro_select, 'Value', hd.active); %1 = same channel, 2=sep channel
        else
            set(handles.tck_enable_m2, 'Value', 0); %Disable M2
            set(handles.pnl_m2, 'Visible', 'off'); %show if enabled
        end
            
            set(handles.edt_mn_isi_m2, 'String', num2str(hd.isi)); %ISI 1
            set(handles.edt_beep_len_m2, 'String', num2str(hd.toneDur)); %Tone duration.
            set(handles.edt_beep_f_m2, 'String', num2str(hd.toneFreq)); %Tone frequency
            set(handles.edt_shift_pos_m2, 'String', num2str(hd.phasePos)); %phase shift position
            set(handles.edt_shift_size_m2, 'String', num2str(hd.phaseSize)); %phase shift magnitude
            set(handles.tck_neg_shift_m2, 'Value', hd.phaseNeg); %phase shift direction
            set(handles.tck_per_shift_m2, 'Value', hd.phasePeriod); %period shift set
                        
            
            %Jitter setting
            set(handles.edt_sd_isi_m2, 'String', num2str(hd.isi_sd)); %set isi jitter           
            set(handles.edt_m2_offset, 'String', num2str(hd.offset)); %set offset between M1 and M2
            %set(handles.edt_m2_offset, 'String', num2str(0)); %m1 m2 offset not yet supported for 3 metronomes.
            
%             switch hdata.metro_sel
%                 case 2
                    set(handles.edt_num_beeps2, 'String', num2str(hd.numBeeps)); %numb r metronome beatse
%                 case 3
%                     set(handles.edt_num_beeps3, 'String', num2str(hd.numBeeps)); %numb r metronome beatse
%                 case 4
%                     set(handles.edt_num_beeps4, 'String', num2str(hd.numBeeps)); %numb r metronome beatse
%             end
            
            for cnt = 2:hdata.max_metro %enable/disable each num beeps field
                switch cnt
                    case 2
                        edt_sel = handles.edt_num_beeps2;
                    case 3
                        edt_sel = handles.edt_num_beeps3;
                    case 4
                        edt_sel = handles.edt_num_beeps4;
                end
                if hdata.metronome{cnt}.active
                    set(edt_sel, 'Enable', 'on');
                else
                    set(edt_sel, 'Enable', 'off');
                end
                set(edt_sel, 'String', num2str(hdata.metronome{cnt}.numBeeps));
            end
            
                
                        
       
    end

    function update_hdata_Callback(hObject, evendata)
    %retreives values from the GUI and updates the hdata variable
    hdata = guidata(hObject);
    %      m = hdata.metro_sel; %current metronome selected
    m = 2; %only metronome 2 available in addition
    hd = hdata.metronome{1}; %shorten
    
     hd.isi = str2double(get(handles.edt_mn_isi, 'String'));
     hd.toneDur = str2double(get(handles.edt_beep_len, 'String'));
     hd.toneFreq = str2double(get(handles.edt_beep_f, 'String'));
     hd.isi_sd = str2double(get(handles.edt_sd_isi, 'String'));
     hd.numBeeps = str2double(get(handles.edt_num_beeps1, 'String'));
     
     hd.phasePos = str2double(get(handles.edt_shift_pos, 'String')); %phase shift position
     hd.phaseSize = str2double(get(handles.edt_shift_size, 'String')); %phase shift magnitude
     hd.phaseNeg = get(handles.tck_neg_shift, 'Value'); %phase shift direction
     hd.phasePeriod = get(handles.tck_per_shift, 'Value'); %period shift set
     
     hdata.metronome{1} = hd;
     guidata(hObject, hdata);
     
     hd = hdata.metronome{m}; %shorten
     
     hd.isi = str2double(get(handles.edt_mn_isi_m2, 'String'));
     hd.toneDur = str2double(get(handles.edt_beep_len_m2, 'String'));
     hd.toneFreq = str2double(get(handles.edt_beep_f_m2, 'String'));
     hd.isi_sd = str2double(get(handles.edt_sd_isi_m2, 'String'));
     hd.offset = str2double(get(handles.edt_m2_offset, 'String'));
     
     hd.phasePos = str2double(get(handles.edt_shift_pos_m2, 'String')); %phase shift position
     hd.phaseSize = str2double(get(handles.edt_shift_size_m2, 'String')); %phase shift magnitude
     hd.phaseNeg = get(handles.tck_neg_shift_m2, 'Value'); %phase shift direction
     hd.phasePeriod = get(handles.tck_per_shift_m2, 'Value'); %period shift set
     
     if get(handles.tck_enable_m2, 'Value') == 1
         hd.active = get(handles.pop_metro_select, 'Value'); %same or sep channel
     else
         hd.active = 0; %not enabled. 
     end
     
     hdata.metronome{m} = hd;
     
     
     hdata.metronome{1}.numBeeps = str2double(get(handles.edt_num_beeps1, 'String')); %set all metronome num beeps
     hdata.metronome{2}.numBeeps = str2double(get(handles.edt_num_beeps2, 'String')); %set all metronome num beeps
%      hdata.metronome{3}.numBeeps = str2double(get(handles.edt_num_beeps3, 'String')); %as all on show
%      hdata.metronome{4}.numBeeps = str2double(get(handles.edt_num_beeps4, 'String'));
     
     
     
     for m= 1:hdata.max_metro
        hdata.metronome{m}.secsSilence = str2double(get(handles.edt_silence, 'String')); %ALL have to be same continuation
     end
     guidata(hObject, hdata);
    end



    function pop_metro_select_Callback(hObject, evendata)
            
        prev_metro_sel = hdata.metro_sel; %previously selected metronome  
        new_metro_sel = get(handles.pop_metro_select, 'Value')+1; %current metronome
        
        if prev_metro_sel ~= new_metro_sel %swapped to new metronome
            %store any updated values on GUI to hdata...
            update_hdata_Callback(hObject, []); %update any values entered into the GUI before changing
        end
        hdata.metro_sel = new_metro_sel; %update to new metronome
        guidata(hObject, hdata);
        update_GUI_Callback(hObject, []); %update GUI
    end


    function an_options_Callback(hObject,evendata)
        hdata = guidata(hObject);
        hdata.eventtype = [get(handles.pop_eventdet_tap1, 'Value')-1, get(handles. pop_eventdet_tap2, 'Value')-1]; %get the event detection types
        hdata.visual_on = get(handles.tck_vischk, 'Value'); %get visual check setting
        hdata.inc_xl = get(handles.tck_inc_xl, 'Value'); %get include Excel setting
        
        guidata(hObject, hdata);
    end


    function txt_exp_scr_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function txt_exp_scr_CreateFcn(hObject,evendata)
        
    end

    function txt_auto_scr_pos_Callback(hObject,evendata)
        
    end

%--------------------------------------------------------------------------

    function rad_isi_fix_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function rad_isi_rnd_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function rad_isi_fix_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function rad_isi_rnd_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function tck_neg_shift_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function tck_per_shift_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function tck_neg_shift_m2_Callback(hObject,evendata)
        
    end


%-------------------------------------------------------------------------------


%-------------------------------------------------------------------------------
%-------------------------------------------------------------------------------
    function tck_per_shift_m2_Callback(hObject,evendata)
        
    end


%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
    function edt_sd_isi_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_sd_isi_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_len_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_len_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_mn_isi_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_mn_isi_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_f_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_f_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_pos_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_pos_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_size_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_size_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_f_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_f_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_mn_isi_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_mn_isi_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_sd_isi_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_sd_isi_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_len_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_beep_len_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_m2_offset_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_m2_offset_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_pos_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_pos_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_size_m2_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_shift_size_m2_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_num_beeps_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_num_beeps_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_silence_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_silence_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_Fs_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_Fs_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_new_exp_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_new_exp_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_work_path_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function edt_work_path_CreateFcn(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function list_exp_Callback(hObject,evendata)
        refresh_trial(handles, hObject);
    end

%-------------------------------------------------------------------------------
    function list_exp_CreateFcn(hObject,evendata)
        
    end


%-------------------------------------------------------------------------------
    function pop_digi_mode_Callback(hObject,evendata)
        
    end

%-------------------------------------------------------------------------------
    function pop_digi_mode_CreateFcn(hObject,evendata)
        
    end



%-------------------------------------------------------------------------------


end




