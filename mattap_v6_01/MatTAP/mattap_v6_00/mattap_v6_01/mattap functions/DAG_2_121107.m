function fig_hdl = DAG_2(raw_data, markers)
% DAG_2_BUILD
%-------------------------------------------------------------------------------
% File name   : DAG_2_build.m                 
% Generated on: 30-Jan-2012 15:27:26          
% Description : Data Analyser GUI
% Copyright 2012, 2013, Mark Elliott/University of Birmingam
%
% raw_data: col 1: time vector, col 2: amplitude vector
% markers: col1: time of marker, col2: amplitude of marker. 
%-------------------------------------------------------------------------------


% Initialize handles structure
% handles = struct();

% Create all UI controls
% build_gui(raw_data, annotations);


%% ---------------------------------------------------------------------------
% 	function build_gui()
% Creation of all uicontrols

		% --- FIGURE -------------------------------------
		handles.figure1 = figure( ...
			'Tag', 'figure1', ...
			'Units', 'characters', ...
			'Position', [103.8 29.1538461538462 112 32.3076923076923], ...
			'Name', 'DAG_2', ...
			'MenuBar', 'none', ...
			'NumberTitle', 'off', ...
			'Color', get(0,'DefaultUicontrolBackgroundColor'));
    
        movegui('center'); %Center GUI
%         maximize;
        
		% --- AXES -------------------------------------
		handles.axes1 = axes( ...
			'Parent', handles.figure1, ...
			'Tag', 'axes1', ...
			'Units', 'normalized', ...
			'Position', [0.1 0.5 .9 .7],...
            'ActivePositionProperty','OuterPosition');

		% --- PUSHBUTTONS -------------------------------------
% 		handles.btn_undo = uicontrol( ...
% 			'Parent', handles.figure1, ...
% 			'Tag', 'btn_undo', ...
% 			'Style', 'pushbutton', ...
% 			'Units', 'normalized', ...
% 			'Position', [.05 .94 .15 .05], ...
% 			'String', 'Undo', ...
% 			'Callback', @btn_Undo_Callback);

		handles.btn_add = uicontrol( ...
			'Parent', handles.figure1, ...
			'Tag', 'btn_add', ...
			'Style', 'pushbutton', ...
			'Units', 'normalized', ...
			'Position', [.35 .94 .15 .05], ...
			'String', 'Add Marker', ...
			'Callback', @btn_add_Callback);

		handles.btn_remove = uicontrol( ...
			'Parent', handles.figure1, ...
			'Tag', 'btn_remove', ...
			'Style', 'Pushbutton', ...
			'Units', 'normalized', ...
			'Position', [.55 .94 .15 .05], ...
			'String', 'Remove Marker', ...
			'Callback', @btn_remove_Callback);

		handles.tgl_zoom = uicontrol( ...
			'Parent', handles.figure1, ...
			'Tag', 'tgl_zoom', ...
			'Style', 'toggle', ...
			'Units', 'normalized', ...
			'Position', [.15 .94 .15 .05], ...
			'String', 'Zoom', ...
			'Callback', @tgl_zoom_Callback);
        
        handles.btn_save = uicontrol( ...
			'Parent', handles.figure1, ...
			'Tag', 'btn_save', ...
			'Style', 'pushbutton', ...
			'Units', 'normalized', ...
			'Position', [.75 .94 .15 .05], ...
			'String', 'Continue', ...
			'Callback', @btn_save_Callback);


% 	end

guidata(handles.figure1,handles);

% Assign function output
fig_hdl = handles.figure1;

%% pass data
hdata = guidata(handles.figure1);
hdata.raw_data = raw_data;
hdata.markers = markers;
guidata(handles.figure1, hdata); %save data

plot(hdata.raw_data(:,1), hdata.raw_data(:,2))
hold on
plot(hdata.markers(:,1), hdata.markers(:,2),'ro','LineWidth', 2, 'MarkerSize', 8)


%% ---------------------------------------------------------------------------
	function btn_undo_Callback(hObject,evendata) %#ok<INUSD>

	end

%% ---------------------------------------------------------------------------
	function btn_add_Callback(hObject,evendata) %#ok<INUSD>
        bt_str = get(hObject, 'String');
        if strcmp(bt_str, 'Add Marker')
            set(hObject, 'String', 'PRESS RETURN TO EXIT MARKER ADDITION');
        end
        hdata = guidata(hObject); %retreive data
        zoom off
        rd = hdata.raw_data;
        mk = hdata.markers;
        [xx,yy] = ginput(1);
        if ~isempty(xx)
            ed = sqrt((xx - rd(:,1)).^2 + (yy - rd(:,2)).^2);
            [dummy, m1] = min(ed); %min distance from plot
            x_snap = rd(m1, 1); %snap to nearest time
            y_snap = rd(m1, 2); %snap to nearest y val
            hdata.markers = [mk; [x_snap,y_snap]]; %add new point
            plot(x_snap, y_snap, 'go', 'LineWidth', 2, 'MarkerSize', 8)
            set(handles.tgl_zoom, 'Value', 0);
            guidata(hObject, hdata); %save data
            btn_add_Callback(hObject,evendata)
        else
            set(hObject, 'String', 'Add Marker');
        end
	end

%% ---------------------------------------------------------------------------
	function btn_remove_Callback(hObject,evendata) %#ok<INUSD>
        bt_str = get(hObject, 'String');
        if strcmp(bt_str, 'Remove Marker')
            set(hObject, 'String', 'PRESS RETURN TO EXIT MARKER REMOVAL');
        end
        hdata = guidata(hObject); %retreive data
        zoom off;
        rd = hdata.raw_data;
        mk = hdata.markers;
        [xx,yy] = ginput(1);
        if ~isempty(xx)
            ed = sqrt((xx - mk(:,1)).^2 + (yy - mk(:,2)).^2);
            [dummy, m1] = min(ed); %min distance from plot
            tmp = mk([1:(m1-1), (m1+1:end)], :); %remove row identified
            hdata.markers = tmp; %point removed
            hold off
            plot(hdata.raw_data(:,1), hdata.raw_data(:,2))
            hold on
            plot(hdata.markers(:,1), hdata.markers(:,2),'ro', 'LineWidth', 2, 'MarkerSize', 8)
            set(handles.tgl_zoom, 'Value', 0); %Switch off zoom
            guidata(hObject, hdata); %save data
            btn_remove_Callback(hObject,evendata) %loop until Return is pressed
        else
           set(hObject, 'String', 'Remove Marker'); 
        end
        
	end

%% ---------------------------------------------------------------------------
	

%% ---------------------------------------------------------------------------
	function btn_save_Callback(hObject,evendata) %#ok<INUSD>
        hdata = guidata(hObject); %retreive data
        hdata.markers = sortrows(hdata.markers , 1); %resort markers in to time order.
        guidata(hObject, hdata);
        uiresume;
    end

%% ----------------------
    function tgl_zoom_Callback(hObject, evendata)
        button_state = get(hObject,'Value');
        if button_state == get(hObject,'Max')
            zoom on
        elseif button_state == get(hObject,'Min')
            zoom out
        end
    end


end

function btn_remove_KeyPress(hObject, eventdata)
hdata = guidata(hObject);   
if strcmp(eventdata.Key,'return')
        set(hdata.btn_remove, 'String', 'Remove Marker');
    end
end
