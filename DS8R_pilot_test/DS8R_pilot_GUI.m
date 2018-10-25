function varargout = DS8R_pilot_GUI(varargin)
% DS8R_PILOT_GUI MATLAB code for DS8R_pilot_GUI.fig
%      DS8R_PILOT_GUI, by itself, creates a new DS8R_PILOT_GUI or raises the existing
%      singleton*.
%
%      H = DS8R_PILOT_GUI returns the handle to a new DS8R_PILOT_GUI or the handle to
%      the existing singleton*.
%
%      DS8R_PILOT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DS8R_PILOT_GUI.M with the given input arguments.
%
%      DS8R_PILOT_GUI('Property','Value',...) creates a new DS8R_PILOT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DS8R_pilot_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DS8R_pilot_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DS8R_pilot_GUI

% Last Modified by GUIDE v2.5 24-Oct-2018 19:05:13

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DS8R_pilot_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @DS8R_pilot_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DS8R_pilot_GUI is made visible.
function DS8R_pilot_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DS8R_pilot_GUI (see VARARGIN)


handles.screen_mode = get(handles.Testmode_button, 'string');
set(handles.uipanel1, 'visible','on')
set(handles.uipanel2, 'visible','off')
handles.plot_count = 1;
handles.plot_stack = [];
handles.plot_stack_name = strings(1, 1);

% Choose default command line output for DS8R_pilot_GUI

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DS8R_pilot_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DS8R_pilot_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function SID_edit_Callback(hObject, eventdata, handles)
% hObject    handle to SID_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SID_edit as text
%        str2double(get(hObject,'String')) returns contents of SID_edit as a double

% --- Executes during object creation, after setting all properties.
function SID_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SID_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function SNB_edit_Callback(hObject, eventdata, handles)
% hObject    handle to SNB_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SNB_edit as text
%        str2double(get(hObject,'String')) returns contents of SNB_edit as a double

% --- Executes during object creation, after setting all properties.
function SNB_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNB_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RNB_edit_Callback(hObject, eventdata, handles)
% hObject    handle to RNB_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of RNB_edit as text
%        str2double(get(hObject,'String')) returns contents of RNB_edit as a double


% --- Executes during object creation, after setting all properties.
function RNB_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to RNB_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in explain_check.
function explain_check_Callback(hObject, eventdata, handles)
% hObject    handle to explain_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of explain_check

% --- Executes on button press in practice_check.
function practice_check_Callback(hObject, eventdata, handles)
% hObject    handle to practice_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of practice_check

% --- Executes on button press in run_check.
function run_check_Callback(hObject, eventdata, handles)
% hObject    handle to run_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of run_check

% --- Executes on button press in eyelink_check.
function eyelink_check_Callback(hObject, eventdata, handles)
% hObject    handle to eyelink_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of eyelink_check

% --- Executes on button press in biopac_check.
function biopac_check_Callback(hObject, eventdata, handles)
% hObject    handle to biopac_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of biopac_check

% --- Executes on button press in Start_button.
function Start_button_Callback(hObject, eventdata, handles)
% hObject    handle to Start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
global W H window_ratio window_num window_rect theWindow fontsize font %window property
global lb1 rb1 lb2 rb2 scale_W scale_H anchor_lms  %rating scale
global bgcolor white orange red  %color
global basedir data
    
basedir = pwd;
cd(basedir);
addpath(genpath(basedir));

SID = get(handles.SID_edit, 'String');
SubjNum = str2num(get(handles.SNB_edit, 'String'));
Trials_num  = str2num(get(handles.Trials_num_edit, 'String'));
GUI_table_data = get(handles.uitable1, 'data');
Screen_mode = handles.screen_mode;

if get(handles.explain_check,'Value'); explain = true; else; explain = false; end
if get(handles.practice_check,'Value'); practice = true; else; practice = false; end
if get(handles.run_check,'Value'); run = true; else; run = false; end

% Start program
DS8R_pilot_save(SID, SubjNum, basedir)
DS8R_pilot_setscreen(Screen_mode)
DS8R_pilot_run(GUI_table_data, Trials_num, explain, practice, run)

% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)

global GUI_table_data
GUI_table_data = get(hObject, 'data');

function Rating_time_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Rating_time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Rating_time_edit as text
%        str2double(get(hObject,'String')) returns contents of Rating_time_edit as a double

% --- Executes during object creation, after setting all properties.
function Rating_time_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Rating_time_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Trials_num_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Trials_num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Trials_num_edit as text
%        str2double(get(hObject,'String')) returns contents of Trials_num_edit as a double

% --- Executes during object creation, after setting all properties.
function Trials_num_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Trials_num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center')



function Stimulus_interval_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Stimulus_interval_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stimulus_interval_edit as text
%        str2double(get(hObject,'String')) returns contents of Stimulus_interval_edit as a double


% --- Executes during object creation, after setting all properties.
function Stimulus_interval_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stimulus_interval_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Stimulus_num_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Stimulus_num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Stimulus_num_edit as text
%        str2double(get(hObject,'String')) returns contents of Stimulus_num_edit as a double


% --- Executes during object creation, after setting all properties.
function Stimulus_num_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Stimulus_num_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch(get(eventdata.NewValue, 'Tag'))
    case 'Full_button'
        screen_mode = get(handles.Full_button, 'string');
%         set(handles.screen_mode, 'string', a);
    case 'Semifull_button'
        screen_mode = get(handles.Semifull_button, 'string');
%         set(handles.screen_mode, 'string', a);        
    case 'Middle_button'
        screen_mode = get(handles.Middle_button, 'string');
%         set(handles.screen_mode, 'string', a);        
    case 'Small_butoon'
        screen_mode = get(handles.Small_butoon, 'string');
%         set(handles.screen_mode, 'string', a);
    case 'Test_button'
        screen_mode = get(handles.Test_button, 'string');
%         set(handles.screen_mode, 'string', a);
    case 'Testmode_button'
        screen_mode = get(handles.Testmode_button, 'string');
%         set(handles.screen_mode, 'string', a);
end
handles.screen_mode = screen_mode;

% handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in cont_tating_check.
function cont_tating_check_Callback(hObject, eventdata, handles)
% hObject    handle to cont_tating_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cont_tating_check


% --- Executes on button press in setting_button.
function setting_button_Callback(hObject, eventdata, handles)
% hObject    handle to setting_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1, 'visible','on')
set(handles.uipanel2, 'visible','off')

% --- Executes on button press in graph_button.
function graph_button_Callback(hObject, eventdata, handles)
% hObject    handle to graph_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel1, 'visible','off')
set(handles.uipanel2, 'visible','on')


% --- Executes on button press in Load_data_button.
function Load_data_button_Callback(hObject, eventdata, handles)
% hObject    handle to Load_data_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.mat'}, 'File Selector');

if ~filename == 0
    fullpathname = strcat(pathname, filename);
    if ~fullpathname == 0
        axes(handles.Result_axes);        
        load(fullpathname)
        
        x = data.dat.overall_int_rating_endpoint(1,:);
        y = data.dat.overall_int_rating_endpoint(2,:);
        
        handles.plot_stack(handles.plot_count) = scatter(x,y);
        handles.plot_stack_name(handles.plot_count) = filename;
        legend(handles.plot_stack_name, 'Location','northwest');

        axis([80 520 -0.1 1])
        xlabel('Demends', 'FontSize', 10, 'Color', 'w');
        ylabel('Rating', 'FontSize', 10, 'Color', 'w');
        
        
        hold on
        
        handles.plot_count = handles.plot_count + 1;
    end
end

guidata(hObject, handles);


% --- Executes on button press in Clear_figure_button.
function Clear_figure_button_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_figure_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% clf(handles.Result_axes, 'reset')
if handles.plot_count-1 > 0
    delete(handles.plot_stack(handles.plot_count-1));
    handles.plot_stack(handles.plot_count-1) = [];
    handles.plot_stack_name(handles.plot_count-1) = [];
    handles.plot_count = handles.plot_count - 1;
end

if handles.plot_count - 1 == 0
            axes(handles.Result_axes);  
            legend('off');
end
 
guidata(hObject, handles);
