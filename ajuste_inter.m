function varargout = ajuste_inter(varargin)
% AJUSTE_INTER MATLAB code for ajuste_inter.fig
%      AJUSTE_INTER, by itself, creates a new AJUSTE_INTER or raises the existing
%      singleton*.
%
%      H = AJUSTE_INTER returns the handle to a new AJUSTE_INTER or the handle to
%      the existing singleton*.
%
%      AJUSTE_INTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AJUSTE_INTER.M with the given input arguments.
%
%      AJUSTE_INTER('Property','Value',...) creates a new AJUSTE_INTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ajuste_inter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ajuste_inter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ajuste_inter

% Last Modified by GUIDE v2.5 15-Dec-2021 13:45:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ajuste_inter_OpeningFcn, ...
                   'gui_OutputFcn',  @ajuste_inter_OutputFcn, ...
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


% --- Executes just before ajuste_inter is made visible.
function ajuste_inter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ajuste_inter (see VARARGIN)

% Choose default command line output for ajuste_inter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ajuste_inter wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.editXLinear,'Enable','off');
set(handles.editYLinear,'Enable','off');
set(handles.xr,'Enable','off');

% --- Outputs from this function are returned to the command line.
function varargout = ajuste_inter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editYLinear_Callback(hObject, eventdata, handles)
% hObject    handle to editYLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYLinear as text
%        str2double(get(hObject,'String')) returns contents of editYLinear as a double


% --- Executes during object creation, after setting all properties.
function editYLinear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editXLinear_Callback(hObject, eventdata, handles)
% hObject    handle to editXLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXLinear as text
%        str2double(get(hObject,'String')) returns contents of editXLinear as a double


% --- Executes during object creation, after setting all properties.
function editXLinear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkLinear.
function checkLinear_Callback(hObject, eventdata, handles)
% hObject    handle to checkLinear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkLinear
value = get(handles.checkLinear,'value');
if value == 1
    set(handles.editXLinear,'Enable','on');
    set(handles.editYLinear,'Enable','on');
else
    set(handles.editXLinear,'Enable','off');
    set(handles.editYLinear,'Enable','off');
end


% --- Executes on button press in checkLagrange.
function checkLagrange_Callback(hObject, eventdata, handles)
% hObject    handle to checkLagrange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkLagrange
value = get(handles.checkLagrange,'value');
if value == 1
    set(handles.editXLinear,'Enable','on');
    set(handles.editYLinear,'Enable','on');
    set(handles.xr,'Enable','on');
else
    set(handles.editXLinear,'Enable','off');
    set(handles.editYLinear,'Enable','off');
    set(handles.xr,'Enable','off');
end



% --- Executes on button press in checkDiferencias.
function checkDiferencias_Callback(hObject, eventdata, handles)
% hObject    handle to checkDiferencias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkDiferencias
value = get(handles.checkDiferencias,'value');
if value == 1
    set(handles.editXLinear,'Enable','on');
    set(handles.editYLinear,'Enable','on');
    set(handles.xr,'Enable','on');
else
    set(handles.editXLinear,'Enable','off');
    set(handles.editYLinear,'Enable','off');
    set(handles.xr,'Enable','off');
end

% --- Executes on button press in resolverButton.
function resolverButton_Callback(hObject, eventdata, handles)
% hObject    handle to resolverButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
valueLinear = get(handles.checkLinear,'value');
valueLagrange = get(handles.checkLagrange,'value');
valueDiferencias = get(handles.checkDiferencias,'value');
x = get(handles.editXLinear,'String');
y = get(handles.editYLinear,'String');
x = str2num(x); y = str2num(y);

if valueLinear == 1
    RegresionLinear(x,y);
end

if valueLagrange == 1
    xi = get(handles.xr,'String');
    xi = str2num(xi);
    InterpolacionLagrange(x,y,xi);
end

if valueDiferencias == 1
    xz = get(handles.xr,'string');
    xz = str2num(xz);
    InterpolacionNewton(x,y,xz);
end



function xr_Callback(hObject, eventdata, handles)
% hObject    handle to xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xr as text
%        str2double(get(hObject,'String')) returns contents of xr as a double


% --- Executes during object creation, after setting all properties.
function xr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushAxis.
function pushAxis_Callback(hObject, eventdata, handles)
% hObject    handle to pushAxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla;

